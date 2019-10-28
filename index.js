
import { NativeModules } from 'react-native'

const { RNTSplashScreen } = NativeModules

export default {

  hide() {
    RNTSplashScreen.hide()
  },

  getSafeArea() {
    return RNTSplashScreen.getSafeArea()
  }

}
