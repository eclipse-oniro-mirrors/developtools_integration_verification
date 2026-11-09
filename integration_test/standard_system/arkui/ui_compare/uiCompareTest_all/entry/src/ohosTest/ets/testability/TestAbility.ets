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
import { bundleManager, abilityAccessCtrl, UIAbility, AbilityConstant, Configuration } from '@kit.AbilityKit';


import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Hypium } from '@ohos/hypium';
import testSuites from '../test/List.test';
import { window, KeyboardAvoidMode } from '@kit.ArkUI';
import Logger from '../test/model/Logger'
import { GlobalThis } from '../test/model/globalThis'
import { Want } from '@kit.AbilityKit'



import { BusinessError } from '@kit.BasicServicesKit';


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
    let wantStr: string = '';
    try {
      wantStr = JSON.stringify(want);
    } catch (e) {
      wantStr = 'stringify_failed';
    }
    hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + wantStr ?? '');
    hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testSuites)

    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    AppStorage.setOrCreate('currentColorMode', this.context.config.colorMode);

  }


  onConfigurationUpdate(newConfig: Configuration): void {
    AppStorage.setOrCreate('currentColorMode', newConfig.colorMode);
    hilog.info(
      0x0000,
      'testTag',
      'the newConfig.colorMode is %{public}s',
      JSON.stringify(AppStorage.get('currentColorMode')) ?? ''
    );

  }

    onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageCreate');
    GlobalThis.getInstance().setContext('context', this.context)

    let atManager = abilityAccessCtrl.createAtManager();
    let appFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
    let permissionFlags = 0;
    bundleManager.getBundleInfoForSelf(appFlags, (err, data) => {
      if (err) {
        Logger.error(TAG, 'getAllApplicationInfo failed: %{public}s', err.message);
        console.error('')
      }
      let tokenID = data.appInfo.accessTokenId;
      //系统应用可以通过bundleManager.getApplicationInfo获取，普通应用可以通过bundleManager.getBundleInfoForSelf获取
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

    // ============================== 主窗占位页 + 输入法光标避让 ==============================
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    // 用例截图全部走 Settings.createWindow() 建出的 TYPE_FLOAT 浮窗，主窗仅作占位。
    // 原先此处串了 5 个 windowStage.loadContent，目标均为本工程不存在的 RichEditor* 模板页面，
    // 互相覆盖且全部加载失败，属早期从 RichEditor 模板工程拷贝时留下的死路由；
    // 现统一加载本模块 Index 页（已在 test_pages.json 注册），并保留最后一次生效的键盘避让模式。
    windowStage.loadContent('testability/pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
      windowStage.getMainWindowSync().getUIContext().setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE_WITH_CARET);
      hilog.info(0x0000, 'testTag', '%{public}s', 'Succeeded in setting the keyboard avoid mode.');
    });
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