function __rust_binpath_cwd -v PWD
  set -l rust_target_path "$PWD/target/release/"
  if test -e "$rust_target_path"
    set -g __rust_binpath "$rust_target_path"
    set -x PATH $PATH $__rust_binpath
  else
    set -q __rust_binpath
      and set -l index (contains -i -- $__rust_binpath $PATH)
      and set -e PATH[$index]
      and set -e __rust_binpath
  end
end

__rust_binpath_cwd $PWD
