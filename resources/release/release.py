import semver

def main():
    version = update_version()
    print(version)


def update_version():
    with open("Ballerina.toml", "r+") as ballerina_toml:
        updated_ballerina_toml_file = ""
        for line in ballerina_toml:
            if "version =" in line:
                new_version = bump_version(line)
                line = f'version = "{new_version}"\n'
            updated_ballerina_toml_file += line

        ballerina_toml.seek(0)
        ballerina_toml.write(updated_ballerina_toml_file)


def bump_version(version_line):
    version_string = version_line.split("=")[-1].strip().replace("\"", "")
    version = semver.VersionInfo.parse(version_string)
    new_version = version.bump_patch()
    return new_version


main()
