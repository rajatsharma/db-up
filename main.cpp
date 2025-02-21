#include <filesystem>
#include <fstream>
#include <iostream>

using namespace std;
namespace fs = std::__fs::filesystem;

int main(int argc, char** argv) {
  string current_path = fs::current_path();
  const char* dirname = std::strrchr(current_path.c_str(), '/');

  string compose =
      "services:\n"
      "  database:\n"
      "    image: 'postgres:latest'\n"
      "    ports:\n"
      "      -'5432':'5432'\n"
      "    environment:\n"
      "      POSTGRES_USER: postgres\n"
      "      POSTGRES_PASSWORD: postgres\n"
      "      POSTGRES_DB: ";

  ofstream ComposeFile("compose.yaml");
  ComposeFile << compose << ++dirname << endl;
  ComposeFile.close();
}
