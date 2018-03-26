require 'openssl'
require 'securerandom'
require 'digest'

# Generate a 256-bit (32 bytes) secure random number
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

def encode_base58(hex)
  leading_zero_bytes = (hex.match(/^([0]+)/) ? $1 : '').size / 2
  ("1"*leading_zero_bytes) + int_to_base58( hex.to_i(16)  )
end

# SHA-256 hash
def sha256(hex)
  Digest::SHA256.hexdigest([hex].pack("H*"))
end


# Cecksum is first 4 bytes of sha256-sha256 hexdigest.
def checksum(hex)
  sha256(sha256(hex))[0...8]
end

PRIV_KEY_VERSION = '80'
def wif(hex)
  data = PRIV_KEY_VERSION + hex
  encode_base58(data + checksum(data))
end

# Generate_key returns a new 256 bit
# private key as a hex string

puts wif(generate_key)

# Bitcoin uses ECDSA (Elliptic Curve Digital Signature Algorithm) for it’s cryptographic signatures.

# Bitcoin uses the secp256k1 curve
curve = OpenSSL::PKey::EC.new('secp256k1')

# Now we generate the public and private key together
curve.generate_key

puts curve.private_key

puts curve.public_key
