require 'securerandom'
require 'pry'

# Generate a 256-bit (32 bytes) secure random number
#
# Write your own random function by random [0,1] 256 times.
# Then turn that bit array in a hex string that would look just like
# one from above method
#
# No duplicate - keyspace is so massive  `birthday paradox`
def generate_key
  SecureRandom.hex(32)
end

def int_to_base58(int_val, leading_zero_bytes=0)
  alpha = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
  base58_val, base = '', alpha.size
  while int_val > 0
    int_val, remainder = int_val.divmod(base)
    base58_val = alpha[remainder] + base58_val
  end
  base58_val
end

# The wallet import format (WIF) is a format
# for encoding a private key into ASCII space
def encode_base58(hex)
  leading_zero_bytes = (hex.match(/^([0]+)/) ? $1 : '').size / 2
  ("1"*leading_zero_bytes) + int_to_base58( hex.to_i(16) )
end

# SHA-256 hash
def sha256(hex)
 binding.pry
 Digest::SHA256.hexdigest([hex].pack("H*"))
end

# checksum is first 4 bytes of sha256-sha256 hexdigest.
def checksum(hex)
  sha256(sha256(hex))[0...8]
end

PRIV_KEY_VERSION = '80'
def wif(hex)
  data = PRIV_KEY_VERSION + hex
  encode_base58(data + checksum(data))
end

# 1 - Take a private key
# 9ab4f6143cfdaf9d9cbc308c8dc9f79dedf3bd750e853bff624bc761f1d66d8b
#
# 2 - Add a 0x80 byte in front of it for mainnet addresses or 0xef for testnet addresses.
# 809ab4f6143cfdaf9d9cbc308c8dc9f79dedf3bd750e853bff624bc761f1d66d8b
#
# 3. Perform SHA-256 hash on the extended key
# sha256("809ab4f6143cfdaf9d9cbc308c8dc9f79dedf3bd750e853bff624bc761f1d66d8b")
# = 33f736b4605bfa643e5850340c60a38c859a638eaf2a2862f235b61efcc4d0a0
#
# 4. Perform SHA-256 hash on result of SHA-256 hash
# sha256("33f736b4605bfa643e5850340c60a38c859a638eaf2a2862f235b61efcc4d0a0")
# = fe5200bd0c807e71850ce7b6cbc7e4e6e535ab08d801ca2bc997ecc337a94eb5
#
# 5. Take the first 4 bytes of the second SHA-256 hash, this is the checksum
# "fe5200bd0c807e71850ce7b6cbc7e4e6e535ab08d801ca2bc997ecc337a94eb5"[0...8]
# "fe5200bd"
#
# 6. Convert the result from a byte string into a base58 string using Base58Check encoding.
# "809ab4f6143cfdaf9d9cbc308c8dc9f79dedf3bd750e853bff624bc761f1d66d8bfe5200bd"
# encode_base58('809ab4f6143cfdaf9d9cbc308c8dc9f79dedf3bd750e853bff624bc761f1d66d8bfe5200bd')
# "5JzRMu3tsXsE7vDn8qVg4djqfS5AG4oJWW5Nm9PLrQP7pUU7Q28"
puts wif(generate_key)
