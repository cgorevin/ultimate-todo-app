# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/attr_encrypted/all/attr_encrypted.rbi
#
# attr_encrypted-3.1.0

module AttrEncrypted
  def attr_encrypted(*attributes); end
  def attr_encrypted?(attribute); end
  def attr_encrypted_default_options; end
  def attr_encrypted_options; end
  def attr_encryptor(*attributes); end
  def attribute_instance_methods_as_symbols; end
  def attribute_instance_methods_as_symbols_available?; end
  def decrypt(attribute, encrypted_value, options = nil); end
  def encrypt(attribute, value, options = nil); end
  def encrypted_attributes; end
  def method_missing(method, *arguments, &block); end
  def not_empty?(value); end
  def self.extended(base); end
end
module AttrEncrypted::Adapters
end
module AttrEncrypted::Adapters::ActiveRecord
  def attr_encrypted(*attrs); end
  def attribute_instance_methods_as_symbols; end
  def attribute_instance_methods_as_symbols_available?; end
  def method_missing_with_attr_encrypted(method, *args, &block); end
  def self.extended(base); end
end
class ActiveRecord::Base
  def assign_attributes(*args); end
  def assign_attributes_without_attr_encrypted(new_attributes); end
  def attr_encrypted_options=(arg0); end
  def attributes=(*args); end
  def attributes_without_attr_encrypted=(new_attributes); end
  def perform_attribute_assignment(method, new_attributes, *args); end
  def reload(*args, &block); end
  def reload_without_attr_encrypted(options = nil); end
  def self.method_missing(method, *args, &block); end
  def self.method_missing_without_attr_encrypted(method, *arguments, &block); end
  extend AttrEncrypted
  extend AttrEncrypted::Adapters::ActiveRecord
  include AttrEncrypted::InstanceMethods
end
module AttrEncrypted::InstanceMethods
  def decode_salt_if_encoded(salt, encoding); end
  def decrypt(attribute, encrypted_value); end
  def encrypt(attribute, value); end
  def encrypted_attributes; end
  def evaluate_attr_encrypted_option(option); end
  def evaluated_attr_encrypted_options_for(attribute); end
  def generate_iv(algorithm); end
  def load_iv_for_attribute(attribute, options); end
  def load_salt_for_attribute(attribute, options); end
  def prefix_and_encode_salt(salt, encoding); end
end
