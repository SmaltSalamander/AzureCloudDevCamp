# --name/-n apparently it takes it from the name of the build file, not the name passed
az deployment group show \
  -g test \
  -n main	\
  --query properties.outputs