
import { NativeModules } from 'react-native';

const { RNKochavaLaserlike } = NativeModules;

module.exports = {
  init: (options)=>{
    return RNKochavaLaserlike.init(options);
  },
  attributionDictionary: ()=>{
    return RNKochavaLaserlike.attributionDictionary();
  }
};
