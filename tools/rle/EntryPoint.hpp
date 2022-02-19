#pragma once
#include <map>
#include <utility>
#include <string>
#include <locale>
#include <iostream>

std::string LowerCase(const std::string &s){
    std::string lower;
    std::locale loc;
    for(auto c : s) lower += std::tolower(c, loc);
    return std::move(lower);
}

struct CLP{
    std::string S;
    int64_t     I;
    double      F;
    bool        B;

    CLP(bool defaultBool = false) : S(""), I(0), F(0.0), B(defaultBool) {}

    inline void Read(char* s) {
        S = s;
        try { I = std::stoi(s); } catch (...) {}
        try { F = std::stod(s); } catch (...) {}
        if( S=="true" ) B = true; 
        else B = false;
    }

};

struct CommandLine{

    CLP Dummy;

    static CommandLine* Access() { 
        if(m_Instance==nullptr) m_Instance = new CommandLine();
        return m_Instance;
    }

    inline void Parse(int argc, char** argv){
        for(int i=0; i<argc; i++) if( m_Pars.find( argv[i] ) != m_Pars.end() && i+1<argc ) { m_Pars[argv[i]].Read( argv[i+1] ); }
    }

    inline void AddPar(const std::string &par, const bool &defaultBool=false) { m_Pars[par]=std::move(CLP(defaultBool)) ; }
    inline void AddPars(
        const std::string &par1="", const std::string &par2="", const std::string &par3="",
        const std::string &par4="", const std::string &par5="", const std::string &par6="",
        const std::string &par7="", const std::string &par8="", const std::string &par9="", const std::string &par10="") 
        {
            if(par1!="") this->AddPar(par1);
            if(par2!="") this->AddPar(par2);
            if(par3!="") this->AddPar(par3);
            if(par4!="") this->AddPar(par4);
            if(par5!="") this->AddPar(par5);
            if(par6!="") this->AddPar(par6);
            if(par7!="") this->AddPar(par7);
            if(par8!="") this->AddPar(par8);
            if(par9!="") this->AddPar(par9);
            if(par10!="") this->AddPar(par10);
        }

    CLP &Get(const std::string &par) { 
        if( m_Pars.find( par ) != m_Pars.end() ) return m_Pars[par]; 
        else return Dummy;
    }

private:

    std::map<std::string, CLP > m_Pars;

    static CommandLine* m_Instance;
    CommandLine() = default;
};

CommandLine* CommandLine::m_Instance = nullptr;

#define ADD_PAR(x)       CommandLine::Access()->AddPar(x)
#define ADD_PARS(...)    CommandLine::Access()->AddPars(__VA_ARGS__)
#define PARSE_PARS(...)  CommandLine::Access()->Parse(__VA_ARGS__)
#define GET_PAR(x)       CommandLine::Access()->Get(x).S
#define GET_PAR_S(x)     CommandLine::Access()->Get(x).S
#define GET_PAR_I(x)     CommandLine::Access()->Get(x).I
#define GET_PAR_F(x)     CommandLine::Access()->Get(x).F
#define GET_PAR_B(x)     CommandLine::Access()->Get(x).B

#define GET_PAR_SS(x,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(y).S
#define GET_PAR_SI(x,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(y).I
#define GET_PAR_SF(x,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(y).F
#define GET_PAR_SB(x,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(y).B

#define GET_PAR_IS(x,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(y).S
#define GET_PAR_II(x,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(y).I
#define GET_PAR_IF(x,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(y).F
#define GET_PAR_IB(x,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(y).B

#define GET_PAR_FS(x,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(y).S
#define GET_PAR_FI(x,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(y).I
#define GET_PAR_FF(x,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(y).F
#define GET_PAR_FB(x,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(y).B

#define GET_PAR_BS(x,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(y).S
#define GET_PAR_BI(x,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(y).I
#define GET_PAR_BF(x,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(y).F
#define GET_PAR_BB(x,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(y).B

#define GET_PAR_SSS(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).S
#define GET_PAR_SSI(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).I
#define GET_PAR_SSF(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).F
#define GET_PAR_SSB(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).B

#define GET_PAR_SIS(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).S
#define GET_PAR_SII(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).I
#define GET_PAR_SIF(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).F
#define GET_PAR_SIB(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).B

#define GET_PAR_SFS(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).S
#define GET_PAR_SFI(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).I
#define GET_PAR_SFF(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).F
#define GET_PAR_SFB(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).B

#define GET_PAR_SBS(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).S
#define GET_PAR_SBI(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).I
#define GET_PAR_SBF(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).F
#define GET_PAR_SBB(x,z,y)   CommandLine::Access()->Get(x).S, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).B

#define GET_PAR_ISS(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).S
#define GET_PAR_ISI(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).I
#define GET_PAR_ISF(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).F
#define GET_PAR_ISB(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).B

#define GET_PAR_IIS(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).S
#define GET_PAR_III(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).I
#define GET_PAR_IIF(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).F
#define GET_PAR_IIB(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).B

#define GET_PAR_IFS(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).S
#define GET_PAR_IFI(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).I
#define GET_PAR_IFF(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).F
#define GET_PAR_IFB(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).B

#define GET_PAR_IBS(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).S
#define GET_PAR_IBI(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).I
#define GET_PAR_IBF(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).F
#define GET_PAR_IBB(x,z,y)   CommandLine::Access()->Get(x).I, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).B

#define GET_PAR_FSS(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).S
#define GET_PAR_FSI(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).I
#define GET_PAR_FSF(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).F
#define GET_PAR_FSB(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).B

#define GET_PAR_FIS(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).S
#define GET_PAR_FII(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).I
#define GET_PAR_FIF(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).F
#define GET_PAR_FIB(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).B

#define GET_PAR_FFS(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).S
#define GET_PAR_FFI(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).I
#define GET_PAR_FFF(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).F
#define GET_PAR_FFB(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).B

#define GET_PAR_FBS(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).S
#define GET_PAR_FBI(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).I
#define GET_PAR_FBF(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).F
#define GET_PAR_FBB(x,z,y)   CommandLine::Access()->Get(x).F, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).B

#define GET_PAR_BSS(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).S
#define GET_PAR_BSI(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).I
#define GET_PAR_BSF(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).F
#define GET_PAR_BSB(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).S, CommandLine::Access()->Get(y).B

#define GET_PAR_BIS(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).S
#define GET_PAR_BII(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).I
#define GET_PAR_BIF(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).F
#define GET_PAR_BIB(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).I, CommandLine::Access()->Get(y).B

#define GET_PAR_BFS(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).S
#define GET_PAR_BFI(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).I
#define GET_PAR_BFF(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).F
#define GET_PAR_BFB(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).F, CommandLine::Access()->Get(y).B

#define GET_PAR_BBS(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).S
#define GET_PAR_BBI(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).I
#define GET_PAR_BBF(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).F
#define GET_PAR_BBB(x,z,y)   CommandLine::Access()->Get(x).B, CommandLine::Access()->Get(z).B, CommandLine::Access()->Get(y).B

#define MAIN(x,y) int main(int argc, char** argv){ ADD_PAR(y); PARSE_PARS(argc,argv); x( GET_PAR(y) ); }

#define MAIN_S(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_S(__VA_ARGS__) ); }
#define MAIN_I(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_I(__VA_ARGS__) ); }
#define MAIN_F(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_F(__VA_ARGS__) ); }
#define MAIN_B(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_B(__VA_ARGS__) ); }

#define MAIN_SS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SS(__VA_ARGS__) ); }
#define MAIN_SI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SI(__VA_ARGS__) ); }
#define MAIN_SF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SF(__VA_ARGS__) ); }
#define MAIN_SB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SB(__VA_ARGS__) ); }

#define MAIN_IS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IS(__VA_ARGS__) ); }
#define MAIN_II(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_II(__VA_ARGS__) ); }
#define MAIN_IF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IF(__VA_ARGS__) ); }
#define MAIN_IB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IB(__VA_ARGS__) ); }

#define MAIN_FS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FS(__VA_ARGS__) ); }
#define MAIN_FI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FI(__VA_ARGS__) ); }
#define MAIN_FF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FF(__VA_ARGS__) ); }
#define MAIN_FB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FB(__VA_ARGS__) ); }

#define MAIN_BS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BS(__VA_ARGS__) ); }
#define MAIN_BI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BI(__VA_ARGS__) ); }
#define MAIN_BF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BF(__VA_ARGS__) ); }
#define MAIN_BB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BB(__VA_ARGS__) ); }

#define MAIN_SSS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SSS(__VA_ARGS__) ); }
#define MAIN_SSI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SSI(__VA_ARGS__) ); }
#define MAIN_SSF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SSF(__VA_ARGS__) ); }
#define MAIN_SSB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SSB(__VA_ARGS__) ); }

#define MAIN_SIS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SIS(__VA_ARGS__) ); }
#define MAIN_SII(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SII(__VA_ARGS__) ); }
#define MAIN_SIF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SIF(__VA_ARGS__) ); }
#define MAIN_SIB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SIB(__VA_ARGS__) ); }

#define MAIN_SFS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SFS(__VA_ARGS__) ); }
#define MAIN_SFI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SFI(__VA_ARGS__) ); }
#define MAIN_SFF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SFF(__VA_ARGS__) ); }
#define MAIN_SFB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SFB(__VA_ARGS__) ); }

#define MAIN_SBS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SBS(__VA_ARGS__) ); }
#define MAIN_SBI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SBI(__VA_ARGS__) ); }
#define MAIN_SBF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SBF(__VA_ARGS__) ); }
#define MAIN_SBB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_SBB(__VA_ARGS__) ); }

#define MAIN_ISS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_ISS(__VA_ARGS__) ); }
#define MAIN_ISI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_ISI(__VA_ARGS__) ); }
#define MAIN_ISF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_ISF(__VA_ARGS__) ); }
#define MAIN_ISB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_ISB(__VA_ARGS__) ); }

#define MAIN_IIS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IIS(__VA_ARGS__) ); }
#define MAIN_III(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_III(__VA_ARGS__) ); }
#define MAIN_IIF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IIF(__VA_ARGS__) ); }
#define MAIN_IIB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IIB(__VA_ARGS__) ); }

#define MAIN_IFS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IFS(__VA_ARGS__) ); }
#define MAIN_IFI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IFI(__VA_ARGS__) ); }
#define MAIN_IFF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IFF(__VA_ARGS__) ); }
#define MAIN_IFB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IFB(__VA_ARGS__) ); }

#define MAIN_IBS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IBS(__VA_ARGS__) ); }
#define MAIN_IBI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IBI(__VA_ARGS__) ); }
#define MAIN_IBF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IBF(__VA_ARGS__) ); }
#define MAIN_IBB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_IBB(__VA_ARGS__) ); }

#define MAIN_FSS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FSS(__VA_ARGS__) ); }
#define MAIN_FSI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FSI(__VA_ARGS__) ); }
#define MAIN_FSF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FSF(__VA_ARGS__) ); }
#define MAIN_FSB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FSB(__VA_ARGS__) ); }

#define MAIN_FIS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FIS(__VA_ARGS__) ); }
#define MAIN_FII(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FII(__VA_ARGS__) ); }
#define MAIN_FIF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FIF(__VA_ARGS__) ); }
#define MAIN_FIB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FIB(__VA_ARGS__) ); }

#define MAIN_FFS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FFS(__VA_ARGS__) ); }
#define MAIN_FFI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FFI(__VA_ARGS__) ); }
#define MAIN_FFF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FFF(__VA_ARGS__) ); }
#define MAIN_FFB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FFB(__VA_ARGS__) ); }

#define MAIN_FBS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FBS(__VA_ARGS__) ); }
#define MAIN_FBI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FBI(__VA_ARGS__) ); }
#define MAIN_FBF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FBF(__VA_ARGS__) ); }
#define MAIN_FBB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_FBB(__VA_ARGS__) ); }

#define MAIN_BSS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BSS(__VA_ARGS__) ); }
#define MAIN_BSI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BSI(__VA_ARGS__) ); }
#define MAIN_BSF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BSF(__VA_ARGS__) ); }
#define MAIN_BSB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BSB(__VA_ARGS__) ); }

#define MAIN_BIS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BIS(__VA_ARGS__) ); }
#define MAIN_BII(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BII(__VA_ARGS__) ); }
#define MAIN_BIF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BIF(__VA_ARGS__) ); }
#define MAIN_BIB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BIB(__VA_ARGS__) ); }

#define MAIN_BFS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BFS(__VA_ARGS__) ); }
#define MAIN_BFI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BFI(__VA_ARGS__) ); }
#define MAIN_BFF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BFF(__VA_ARGS__) ); }
#define MAIN_BFB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BFB(__VA_ARGS__) ); }

#define MAIN_BBS(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BBS(__VA_ARGS__) ); }
#define MAIN_BBI(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BBI(__VA_ARGS__) ); }
#define MAIN_BBF(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BBF(__VA_ARGS__) ); }
#define MAIN_BBB(x,...) int main(int argc, char** argv){ ADD_PARS(__VA_ARGS__); PARSE_PARS(argc,argv); x( GET_PAR_BBB(__VA_ARGS__) ); }
