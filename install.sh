case "$(uname -s)" in
   Darwin)
     echo 'Installing for macOS'
     ./install_macos.sh
     ;;

   Linux)
     echo 'Installing for Linux'
     ./install_arch.sh
     ;;

   *)
     echo 'Incompatible OS'
     ;;
esac
