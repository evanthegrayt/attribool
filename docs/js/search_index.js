var search_data = {"index":{"searchIndex":["attribool","attribute","attributelist","readername","validatorservice","validators","attributelistvalidator","conditionvalidator","methodnamevalidator","nilattributevalidator","strictbooleanvalidator","value","version","bool_accessor()","bool_reader()","bool_writer()","build()","call()","each()","error()","error()","error()","error()","error()","fetch()","new()","new()","new()","new()","new()","new()","new()","new()","new()","new()","to_a()","to_boolean()","to_h()","to_s()","to_s()","valid?()","valid?()","valid?()","valid?()","valid?()","validate()","readme"],"longSearchIndex":["attribool","attribool::attribute","attribool::attributelist","attribool::readername","attribool::validatorservice","attribool::validators","attribool::validators::attributelistvalidator","attribool::validators::conditionvalidator","attribool::validators::methodnamevalidator","attribool::validators::nilattributevalidator","attribool::validators::strictbooleanvalidator","attribool::value","attribool::version","attribool#bool_accessor()","attribool#bool_reader()","attribool#bool_writer()","attribool::attributelist::build()","attribool::validatorservice::call()","attribool::attributelist#each()","attribool::validators::attributelistvalidator#error()","attribool::validators::conditionvalidator#error()","attribool::validators::methodnamevalidator#error()","attribool::validators::nilattributevalidator#error()","attribool::validators::strictbooleanvalidator#error()","attribool::validators#fetch()","attribool::attribute::new()","attribool::attributelist::new()","attribool::readername::new()","attribool::validatorservice::new()","attribool::validators::attributelistvalidator::new()","attribool::validators::conditionvalidator::new()","attribool::validators::methodnamevalidator::new()","attribool::validators::nilattributevalidator::new()","attribool::validators::strictbooleanvalidator::new()","attribool::value::new()","attribool::version#to_a()","attribool::value#to_boolean()","attribool::version#to_h()","attribool::readername#to_s()","attribool::version#to_s()","attribool::validators::attributelistvalidator#valid?()","attribool::validators::conditionvalidator#valid?()","attribool::validators::methodnamevalidator#valid?()","attribool::validators::nilattributevalidator#valid?()","attribool::validators::strictbooleanvalidator#valid?()","attribool::validatorservice#validate()",""],"info":[["Attribool","","Attribool.html","","<p>Adds macros for dealing with boolean attributes.\n<p>@example\n\n<pre>require &quot;attribool&quot;\nclass Person\n  extend Attribool ...</pre>\n"],["Attribool::Attribute","","Attribool/Attribute.html","","<p>Abstraction for an attribute to determine its name, reader, writer, and instance variable name.\n"],["Attribool::AttributeList","","Attribool/AttributeList.html","","<p>Enumerable class that generates a list of attributes from a list of strings or symbols.\n"],["Attribool::ReaderName","","Attribool/ReaderName.html","","<p>Abstraction of a reader’s method name.\n"],["Attribool::ValidatorService","","Attribool/ValidatorService.html","","<p>A simple interface to run validators, which should implement a <code>valid?</code> method which returns true if conditions …\n"],["Attribool::Validators","","Attribool/Validators.html","","<p>Namespace for Validators. Also provides a method for fetching a validator.\n"],["Attribool::Validators::AttributeListValidator","","Attribool/Validators/AttributeListValidator.html","","<p>Ensures that every item is an instance of <code>Attribool::Attribute</code>.\n"],["Attribool::Validators::ConditionValidator","","Attribool/Validators/ConditionValidator.html","","<p>Ensures that a condition is either <code>nil</code> or a <code>Proc</code>.\n"],["Attribool::Validators::MethodNameValidator","","Attribool/Validators/MethodNameValidator.html","","<p>Ensures that if multiple attributes are being defined, and <code>method_name</code> is provided, that <code>method_name</code> …\n"],["Attribool::Validators::NilAttributeValidator","","Attribool/Validators/NilAttributeValidator.html","","<p>Ensures that a value is not <code>nil</code>, unless <code>nil</code> is allowed as a value.\n"],["Attribool::Validators::StrictBooleanValidator","","Attribool/Validators/StrictBooleanValidator.html","","<p>Ensures that a value is a boolean, unless strictness isn’t enforced.\n"],["Attribool::Value","","Attribool/Value.html","","<p>An abstraction of any class that can convert itself to a boolean.\n"],["Attribool::Version","","Attribool/Version.html","","<p>Module that contains all gem version information. Follows semantic versioning. Read: semver.org/\n"],["bool_accessor","Attribool","Attribool.html#method-i-bool_accessor","(*attributes)","<p>Creates a simple reader and writer for booleans. This should only be used when the attribute should only …\n"],["bool_reader","Attribool","Attribool.html#method-i-bool_reader","(*attributes, allow_nil: true, method_name: nil, condition: nil)","<p>Creates methods that return a boolean for attributes that may or may not be booleans themselves. Multiple …\n"],["bool_writer","Attribool","Attribool.html#method-i-bool_writer","(*attributes, strict: false)","<p>Creates a writer for boolean attributes. Always coerces to boolean based on truthiness.\n<p>@param [Symbol, …\n"],["build","Attribool::AttributeList","Attribool/AttributeList.html#method-c-build","(*attribute_names, method_name: nil)","<p>Create an <code>AttributeList</code> from a list of attribute names.\n<p>@param [String, Symbol] *attribute_names\n<p>@kwarg …\n"],["call","Attribool::ValidatorService","Attribool/ValidatorService.html#method-c-call","(validator_name, *args)","<p>Run the validator.\n<p>@param [Symbol] validator_name\n<p>@param [Object] *args to be forwarded to validator\n"],["each","Attribool::AttributeList","Attribool/AttributeList.html#method-i-each","","<p>Yield every entry in the list to a block.\n<p>@param [block] &amp;block\n<p>@return [Enumerable]\n"],["error","Attribool::Validators::AttributeListValidator","Attribool/Validators/AttributeListValidator.html#method-i-error","()","<p>The exception to raise if validations fail.\n<p>@return [TypeError] the exception with message\n"],["error","Attribool::Validators::ConditionValidator","Attribool/Validators/ConditionValidator.html#method-i-error","()","<p>The exception to raise if validations fail.\n<p>@return [ArgumentError] the exception with message\n"],["error","Attribool::Validators::MethodNameValidator","Attribool/Validators/MethodNameValidator.html#method-i-error","()","<p>The exception to raise if validations fail.\n<p>@return [ArgumentError] the exception with message\n"],["error","Attribool::Validators::NilAttributeValidator","Attribool/Validators/NilAttributeValidator.html#method-i-error","()","<p>The exception to raise if validations fail.\n<p>@return [TypeError] the exception with message\n"],["error","Attribool::Validators::StrictBooleanValidator","Attribool/Validators/StrictBooleanValidator.html#method-i-error","()","<p>The exception to raise if validations fail.\n<p>@return [ArgumentError] the exception with message\n"],["fetch","Attribool::Validators","Attribool/Validators.html#method-i-fetch","(validator_name)","<p>Fetches a Validator class.\n<p>@param [String, Symbol] validator_name\n<p>@return [Class]\n"],["new","Attribool::Attribute","Attribool/Attribute.html#method-c-new","(attribute, reader_name = nil)","<p>Create an Attribute. The attribute can either be a String or a Symbol.\n<p>@param [String, Symbol] attribute …\n"],["new","Attribool::AttributeList","Attribool/AttributeList.html#method-c-new","(*attributes)","<p>Construct the list.\n<p>@param [String, Symbol] *attributes\n"],["new","Attribool::ReaderName","Attribool/ReaderName.html#method-c-new","(attribute, name)","<p>Instantiate new instance of ReaderName.\n<p>@param [String, Syumbol] attribute\n<p>@param [proc, nil, String, Symbol] …\n"],["new","Attribool::ValidatorService","Attribool/ValidatorService.html#method-c-new","(validator, *args)","<p>Construct the service and inject the validator.\n<p>@param [Class] Validator\n<p>@param [Object] *args\n"],["new","Attribool::Validators::AttributeListValidator","Attribool/Validators/AttributeListValidator.html#method-c-new","(*items)","<p>Construct the validator.\n<p>@param [Attribool::Attribute] *items\n"],["new","Attribool::Validators::ConditionValidator","Attribool/Validators/ConditionValidator.html#method-c-new","(condition)","<p>Construct the validator.\n<p>@param [nil, Proc] condition\n"],["new","Attribool::Validators::MethodNameValidator","Attribool/Validators/MethodNameValidator.html#method-c-new","(method_name, number_of_attributes)","<p>Construct the validator.\n<p>@param [Attribool::Attribute] *items\n"],["new","Attribool::Validators::NilAttributeValidator","Attribool/Validators/NilAttributeValidator.html#method-c-new","(ivar, value, allow_nil)","<p>Construct the validator.\n<p>@param [String, Symbol] ivar\n<p>@param [Object] value\n"],["new","Attribool::Validators::StrictBooleanValidator","Attribool/Validators/StrictBooleanValidator.html#method-c-new","(value, strict)","<p>Construct the validator.\n<p>@param [Object] value\n<p>@param [Boolean] strict\n"],["new","Attribool::Value","Attribool/Value.html#method-c-new","(value, condition = nil)","<p>Construct the value with an optional <code>Proc</code> condition.\n<p>@param [Object] value\n<p>@param [Proc] condition (default: …\n"],["to_a","Attribool::Version","Attribool/Version.html#method-i-to_a","()","<p>Version as +[MAJOR, MINOR, PATCH]+\n<p>@return [Array&lt;Integer&gt;]\n"],["to_boolean","Attribool::Value","Attribool/Value.html#method-i-to_boolean","()","<p>Convert the value or the condition to a boolean based off truthiness.\n<p>@return [Boolean]\n"],["to_h","Attribool::Version","Attribool/Version.html#method-i-to_h","()","<p>Version as +{major: MAJOR, minor: MINOR, patch: PATCH}+\n<p>@return [Hash]\n"],["to_s","Attribool::ReaderName","Attribool/ReaderName.html#method-i-to_s","()","<p>Convert instance to a string.\n<p>@return [String]\n"],["to_s","Attribool::Version","Attribool/Version.html#method-i-to_s","()","<p>Version as <code>MAJOR.MINOR.PATCH</code>\n<p>@return [String]\n"],["valid?","Attribool::Validators::AttributeListValidator","Attribool/Validators/AttributeListValidator.html#method-i-valid-3F","()","<p>Are all items an instance of <code>Attribool::Attribute</code>?\n<p>@return [Boolean]\n"],["valid?","Attribool::Validators::ConditionValidator","Attribool/Validators/ConditionValidator.html#method-i-valid-3F","()","<p>Is the condition either <code>nil</code> or a <code>Proc</code>?\n<p>@return [Boolean]\n"],["valid?","Attribool::Validators::MethodNameValidator","Attribool/Validators/MethodNameValidator.html#method-i-valid-3F","()","<p>Is there either one attribute, or is <code>method_name</code> <code>nil</code> or a <code>Proc</code>?\n"],["valid?","Attribool::Validators::NilAttributeValidator","Attribool/Validators/NilAttributeValidator.html#method-i-valid-3F","()","<p>Do we either allow values to be <code>nil</code>, or is the value not <code>nil</code>?\n<p>@return [Boolean]\n"],["valid?","Attribool::Validators::StrictBooleanValidator","Attribool/Validators/StrictBooleanValidator.html#method-i-valid-3F","()","<p>Is <code>strict</code> set to <code>false</code>, or is +@value+ a boolean?\n<p>@return [Boolean]\n"],["validate","Attribool::ValidatorService","Attribool/ValidatorService.html#method-i-validate","()","<p>Raises the validator’s exception unless its conditions are met.\n<p>@return [Boolean]\n<p>@raise [Exception] …\n"],["README","","README_md.html","","<p>Attribool\n<p><img src=\"https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Fevanthegrayt%2Fattribool%2Fbadge%3Fref%3Dmaster&style=flat\"> …\n"]]}}