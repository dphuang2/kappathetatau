module ResumesHelper
  def field_or_nil(field)
    field ? field : "n/a"
  end
end
