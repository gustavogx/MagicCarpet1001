#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <iomanip>
#include <algorithm>
#include <cstdint>

void printUsage() {
    std::cout << "Usage: compare file1 file2 [options]\n"
              << "Options:\n"
              << "  -nes    Offset addresses by $8000 (for NES ROM analysis)\n"
              << "  -c      Only count the number of differences\n";
}

int main(int argc, char** argv) {
    // Parse command-line arguments
    if (argc < 3) {
        std::cerr << "Error: Two input files required.\n";
        printUsage();
        return 1;
    }

    std::string file1Path = argv[1];
    std::string file2Path = argv[2];
    bool nesOffset = false;
    bool countOnly = false;

    // Process optional flags
    for (int i = 3; i < argc; ++i) {
        std::string arg = argv[i];
        if (arg == "-nes") {
            nesOffset = true;
        } else if (arg == "-c") {
            countOnly = true;
        } else {
            std::cerr << "Unknown option: " << arg << "\n";
            printUsage();
            return 1;
        }
    }

    // Open files in binary mode
    std::ifstream file1(file1Path, std::ios::binary);
    std::ifstream file2(file2Path, std::ios::binary);

    if (!file1.is_open()) {
        std::cerr << "Error: Could not open file: " << file1Path << "\n";
        return 1;
    }

    if (!file2.is_open()) {
        std::cerr << "Error: Could not open file: " << file2Path << "\n";
        return 1;
    }

    // Get file sizes
    file1.seekg(0, std::ios::end);
    std::streamsize file1Size = file1.tellg();
    file1.seekg(0, std::ios::beg);

    file2.seekg(0, std::ios::end);
    std::streamsize file2Size = file2.tellg();
    file2.seekg(0, std::ios::beg);

    // Report if file sizes differ
    if (file1Size != file2Size) {
        std::cout << "File sizes differ: "
                  << file1Path << " is " << file1Size << " bytes, "
                  << file2Path << " is " << file2Size << " bytes.\n";
    }

    // Compare files byte by byte
    std::streamsize diffCount = 0;
    std::streamsize maxSize = std::max(file1Size, file2Size);

    for (std::streamsize pos = 0; pos < maxSize; ++pos) {
        uint8_t byte1 = 0;
        uint8_t byte2 = 0;

        if (pos < file1Size) {
            file1.read(reinterpret_cast<char*>(&byte1), 1);
        }

        if (pos < file2Size) {
            file2.read(reinterpret_cast<char*>(&byte2), 1);
        }

        if (byte1 != byte2 || pos >= file1Size || pos >= file2Size) {
            diffCount++;

            if (!countOnly) {
                // Calculate address with optional NES offset
                std::streamsize address = pos;
                if (nesOffset) {
                    address += 0x8000;
                    address -= 0x10;
                }

                // Print the difference
                std::cout << std::hex << std::uppercase << std::setfill('0') << std::setw(6)
                          << address << ": ";

                if (pos < file1Size && pos < file2Size) {
                    std::cout << std::setw(2) << static_cast<int>(byte1) << " -> "
                              << std::setw(2) << static_cast<int>(byte2) << "\n";
                } else if (pos >= file1Size) {
                    std::cout << "-- -> " << std::setw(2) << static_cast<int>(byte2)
                              << " (file1 is shorter)\n";
                } else {
                    std::cout << std::setw(2) << static_cast<int>(byte1) << " -> -- "
                              << " (file2 is shorter)\n";
                }
            }
        }
    }

    // Print summary
    std::cout << std::dec << diffCount << " differences found.\n";

    return 0;
}