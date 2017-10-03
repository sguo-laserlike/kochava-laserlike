using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Kochava.Laserlike.RNKochavaLaserlike
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNKochavaLaserlikeModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNKochavaLaserlikeModule"/>.
        /// </summary>
        internal RNKochavaLaserlikeModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNKochavaLaserlike";
            }
        }
    }
}
