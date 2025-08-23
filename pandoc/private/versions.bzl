"""Mirror of release info

TODO: generate this file from GitHub API"""

# The integrity hashes can be computed with
# shasum -b -a 384 [downloaded file] | awk '{ print $1 }' | xxd -r -p | base64
TOOL_VERSIONS = {
    "3.7.0.2": {
        "x86_64-macOS": "sha384-wUTUkV2+1LWykYPMfmkaUDPo8y9bhdFZN2yBWerUOY++ENMoTjjPsttWyhAJcwNS",
        "arm64-macOS": "sha384-ulD6gNbIaX4bje4kobWLyFAlJ0DFvYe+bgXvk4H47GNFHie5HeVo/PTzcNaiDZ3v",
        "windows-x86_64": "sha384-w0zChRYEoGEVKNrfYwHlUG0tZOfgGheJnEi73EB526P9l02u/1ZC8AcPEeF4yPKP",
        "linux-arm64": "sha384-OUzTHvjUfAXMbad53m+3YNEUrn9eC7jp/GPUzR/SHnzxfaWgKJGsjcEWJOVUBpZ7",
        "linux-amd64": "sha384-5NYFtQ3KG2PCKXbcGChtpudnkANkBGxdzWKZGS4saz59sjVpFMsdz1tkgvmStowO",
    },
}
