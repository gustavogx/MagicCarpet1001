#include <fstream>
#include <string>
#include <iostream>
#include <vector>

std::size_t SizeOf(std::ifstream &file){
	auto start = file.tellg();
	file.seekg(0, std::ios::end);
	auto finish = file.tellg();

	return finish-start;
}

int Load(std::string inFileName, std::vector<uint8_t> &buffer){

	auto inFile = std::ifstream(inFileName, std::ios::binary);

	if( !inFile.is_open() ) -1;

	buffer.resize(SizeOf(inFile));

	inFile.seekg(0);
	inFile.read((char*)&buffer[0], buffer.size());

	inFile.close();
	return buffer.size();
}

int Store(std::string outFileName, std::vector<uint8_t> &buffer){

	auto outFile = std::ofstream(outFileName, std::ios::binary);

	if( !outFile.is_open() ) -1;

	outFile.write((char*)&buffer[0], buffer.size());

	outFile.close();
	return buffer.size();
}

void RLEtoNAM(std::vector<uint8_t> &rleBuffer, std::vector<uint8_t> &namBuffer){

	namBuffer.reserve(namBuffer.size()+rleBuffer.size());
	if(rleBuffer.size()==0) return;
	
	size_t pos = 0;
	do{
		auto key = rleBuffer[pos];
		pos++;
		if(key!=0) {
			if(key<0x80){ // Distinct Tiles
				uint16_t n = key;
				for(auto i=0; i<n; i++) namBuffer.push_back(rleBuffer[pos++]);
			} else { // Repeated Tiles
				uint16_t n = key & 0x7f;
				for(auto i=0; i<n; i++) namBuffer.push_back(rleBuffer[pos]);
				pos++;
			}
		}		
	}while(pos<rleBuffer.size());
}

int NAMtoRLE(std::vector<uint8_t> &namBuffer, std::vector<uint8_t> &rleBuffer, const size_t &start = 0){

	const int namSize = 960;
	rleBuffer.reserve(namSize);
	
	std::vector<uint8_t> string;
	string.reserve(namSize);

	size_t pos = start;

	if(pos>namBuffer.size()) return -1;

	// lambda checker
	auto RepeatingThree = [namBuffer](size_t pos){
		bool condition1, condition2;

		if(pos+1<namBuffer.size()) condition1 = namBuffer[pos] == namBuffer[pos+1];
		else condition1 = false;
		
		if(pos+2<namBuffer.size()) condition2 = namBuffer[pos] == namBuffer[pos+2];
		else condition2 = false;
		
		return condition1 && condition2;
	};

	do{
		if(RepeatingThree(pos)){ // TODO special case of 2 repeating at the border of 960

			string.clear();
			while(namBuffer[pos]==namBuffer[pos+1]) string.push_back(namBuffer[pos++]);

			while(string.size()){

				auto length = string.size()>0x7f ? 0x7f : string.size();
				rleBuffer.push_back(length+0x80);
				rleBuffer.push_back(string.front());
				
				if(length>0x7f) for(auto i=0; i<0x7f; i++) string.pop_back();
				else string.clear();
			}

		} else {

			string.clear();
			while(!RepeatingThree(pos)) string.push_back(namBuffer[pos++]); // TODO it breaks at the last element of nam

			if(string.size()>0x7f) rleBuffer.push_back(0x7f);
			else rleBuffer.push_back(string.size());

			uint8_t counter = 0, block = 0;
			for(auto &key : string){
				rleBuffer.push_back(key);
				counter++;
				if(counter==0x7f) {
					block ++;
					auto remaining = string.size() - block*0x80;

					if(remaining>0x7f) rleBuffer.push_back(0x7f);
					else if(remaining>0) rleBuffer.push_back(remaining);
					counter = 0;
				}
			}

		}
	}while(pos-start<namSize && pos<namBuffer.size());

	return pos;
}

void ConvertRLEtoNAM(std::string inFileName, std::string outFileName, std::string attFileName=""){

	std::vector<uint8_t> rleNam, rleAtt, nam;
	Load(inFileName,rleNam);
	if(attFileName!="") {
		Load(attFileName,rleAtt);
		for(auto &att : rleAtt) rleNam.push_back(att);
	}
	RLEtoNAM(rleNam,nam);
	Store(outFileName,nam);

}

void ConvertNAMtoRLE(std::string inFileName, std::string outFileName, std::string attFileName=""){

	std::vector<uint8_t> rleNam, rleAtt, nam;
	Load(inFileName,nam);

	auto start = NAMtoRLE(nam,rleNam);
	std::cout << start << "\n";

	if(nam.size()>start) NAMtoRLE(nam, rleAtt, start);

	Store(outFileName,rleNam);
	if(rleAtt.size()) Store(attFileName,rleNam);

}

#include "EntryPoint.hpp"

#ifndef NAMTORLE 
	MAIN_SSS(ConvertRLEtoNAM,"-i","-o","-a");
#else
	MAIN_SSS(ConvertNAMtoRLE,"-i","-o","-a");
#endif