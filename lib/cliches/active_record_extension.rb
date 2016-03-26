# :nodoc:
module Cliches::ActiveRecordExtension
  def cliche(name = nil)
    full_name = [name, table_name.singularize].compact.join("_")
    new(Cliches::Definition.find(full_name).value)
  end

  def cliche!(name = nil)
    record = cliche(name)
    record.save!
    record
  end
end