
artifact.registered_materials = {}
artifact.register_material_callbacks = {}

-- Registers a callback func(material_name, material_definition) that is called
-- for every material that gets registered.
function artifact.register_on_register_material(func)
	table.insert(artifact.register_material_callbacks, func)
	for k, v in pairs(artifact.registered_materials) do
		func(k, v)
	end
end

-- Registers a material. The name should be prefixed by the mod name like with
-- item registration, and the definition is a table containing arbitrary keys and
-- values, the meanings of which are decided by whatever uses materials.
function artifact.register_material(name, material_def)
	artifact.registered_materials[name] = material_def
	for _, callback in ipairs(artifact.register_material_callbacks) do
		callback(name, material_def)
	end
end
