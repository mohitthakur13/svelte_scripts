#!/bin/bash/

app_name=$1
svelte_skeleton="npm init svelte"
npm_install="npm install"

svelte_init="$svelte_skeleton $app_name"
$svelte_init
cd $app_name
#$npm_install

app_css="./src/app.css"
__layout_file="./src/routes/__layout.svelte"
tailwind_config_file="./tailwind.config.cjs"


tailwind="npm install -D tailwindcss postcss autoprefixer"
tailwind_config="npx tailwindcss init tailwind.config.cjs -p"
postcss_config="mv postcss.config.js postcss.config.cjs"



$tailwind
$tailwind_config
$postcss_config

echo "module.exports = {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {}
  },
  plugins: []
};
" > $tailwind_config_file


touch $app_css
echo "@tailwind base;
@tailwind components;
@tailwind utilities;" > $app_css


touch $__layout_file
echo "<script>
  import '../app.css';
</script>

<slot />" > $__layout_file

run="npm run dev"
$run
