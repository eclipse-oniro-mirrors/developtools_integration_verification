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
import { uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UIUIAppearanceDarkMode0050 {
  @State name: string = 'UIUIAppearanceDarkMode0050';
  @State message: string = this.name;
  @State darkMode: uiAppearance.DarkMode = uiAppearance.DarkMode.ALWAYS_LIGHT

  build() {
    Column() {
      Text(this.name)
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Button('设置darkMode为1')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .onClick(() => {
          try {
            uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, (error) => {
              if (error) {
                console.error('Set dark-mode as ALWAYS_LIGHT failed, ' + error.message);
                this.message += `\n Set dark-mode as ALWAYS_LIGHT failed, ${error.message}`;
              } else {
                console.info('Set dark-mode as ALWAYS_LIGHT successfully.');
                this.message += `\n Set dark-mode as ALWAYS_LIGHT successfully.`;
              }
            })
          } catch (error) {
            let message = (error as BusinessError).message;
            this.message += `\n Set dark-mode as ALWAYS_LIGHT failed, catched err: ${message}`;
            console.error('Set dark-mode as ALWAYS_LIGHT failed, ' + message);
          }
        })

      Button('设置darkMode为9999')
        .id(this.name + '_02')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .onClick(() => {
          try {
            uiAppearance.setDarkMode(9999, (error) => {
              if (error) {
                console.error('Set dark-mode as 9999 failed, ' + error.message);
                this.message += `\n Set dark-mode as 9999 failed, ${error.message}`;
              } else {
                console.info('Set dark-mode as 9999 successfully.');
                this.message += `\n Set dark-mode as 9999 successfully.`;
              }
            })
          } catch (error) {
            let message = (error as BusinessError).message;
            this.message += `\n Set dark-mode as 9999 failed, catched err: ${message}`;
            console.error('Set dark-mode as 9999 failed, ' + message);
          }
        })

      Text(this.message)
        .fontSize(15)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Regular)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
      
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}
