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
    "3.8.2.1": {
        "x86_64-macOS": "sha384-5HWXgp99WGaJgajaHoTh4D0nP4dmGWi7bfUQsYN5VaGVEYaAxZ8MzbwAfcXvqfFC",
        "arm64-macOS": "sha384-w/nGMD2E0IeA3p4d2aJrCZGOMsyzV1bSyCK6fOA/DvAPm+wKvep/AiaVt7aRIuuA",
        "windows-x86_64": "sha384-RmFdZb28kExJjEHW5xQyIDIu2vXx7JCkn3Ljtes/Z5Q/RmiKj3qLuXGy9G0znO5m",
        "linux-arm64": "sha384-1ZDBuEs1rKmJGMBvWf/F1uxUjSnByWbrSveO3kctG25yaUMviuxg4KP05zB0mw9x",
        "linux-amd64": "sha384-MaaL1h509IyOugSlKOmL841/7YYZIXVFVVXe6G19SejbcooT0E+/QKKxV6V9wPxw",
    },
}
