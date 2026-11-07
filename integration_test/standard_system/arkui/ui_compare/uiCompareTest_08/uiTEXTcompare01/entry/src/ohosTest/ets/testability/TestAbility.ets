/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { bundleManager } from '@kit.AbilityKit';
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { UIAbility } from '@kit.AbilityKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import { window } from '@kit.ArkUI';
import Logger from '../test/model/Logger'
import { GlobalThis } from '../test/model/globalThis'
import { Want } from '@kit.AbilityKit'
import { AbilityConstant } from '@kit.AbilityKit';


const TAG: string = '[TEST]'

async function sleep(time: number): Promise<void> {
  const result: string = await new Promise((resolve: Function) => {
    setTimeout(() => {
      resolve('sleep ok')
    }, time)
  });
  console.info(result);
}

export default class TestAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onCreate');
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageCreate');
    GlobalThis.getInstance().setContext("context", this.context)

    //
    let atManager = abilityAccessCtrl.createAtManager();
    let appFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
    let permissionFlags = 0;
    bundleManager.getBundleInfoForSelf(appFlags, (err, data) => {
      if (err) {
        Logger.error(TAG, 'getAllApplicationInfo failed: %{public}s', err.message);
        console.error("")
      }
      let tokenID = data.appInfo.accessTokenId; //系统应用可以通过bundleManager.getApplicationInfo获取，普通应用可以通过bundleManager.getBundleInfoForSelf获取
      atManager.grantUserGrantedPermission(tokenID, 'ohos.permission.READ_MEDIA', permissionFlags, (err, data) => {
        if (err) {
          Logger.info(TAG, `grantUserGrantedPermission fail, err->${JSON.stringify(err)}`)
        }
      })
      atManager.grantUserGrantedPermission(tokenID, 'ohos.permission.WRITE_MEDIA', permissionFlags, (err, data) => {
        if (err) {
          Logger.info(TAG, `grantUserGrantedPermission fail, err->${JSON.stringify(err)}`)
        }
      })
    })

  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onBackground');
  }
}