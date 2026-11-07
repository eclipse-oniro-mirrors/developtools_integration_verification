/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct Monopolize05 {
  @State message: string = 'RECONSTRUCTION'
  @State stdResult:string = ''
  @State exitCode:number = 0

  build() {
    Column() {
      Text(this.stdResult)
        .fontSize(22)
        .margin(10)
      Text(JSON.stringify(this.exitCode))
        .fontSize(22)
        .margin(10)
      Button(this.message)
        .fontSize(22)
        .id('monopolizeButton05')
        .margin(10)
        .onClick(()=>{
          let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
          let cmd = 'hdc shell hidumper -s WindowManagerService -a \'-a\''
          abilityDelegator.executeShellCommand(cmd,
            (err, d) => {
              hilog.info(0x0000, 'testTag', 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
              hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', JSON.stringify(d.stdResult) ?? '');
              this.stdResult = JSON.stringify(d.stdResult)
              hilog.info(0x0000, 'testTag', 'executeShellCommand : data : %{public}s', JSON.stringify(d.exitCode) ?? '');
              this.exitCode = Number(JSON.stringify(d.exitCode))
            })
        })
    }
    .height('100%')
  }
}
