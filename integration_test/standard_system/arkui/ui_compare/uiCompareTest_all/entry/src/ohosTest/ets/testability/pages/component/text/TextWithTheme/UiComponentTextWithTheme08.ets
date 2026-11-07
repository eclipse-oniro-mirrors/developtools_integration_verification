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

import { uiAppearance } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct UiComponentTextWithTheme08 {
  build() {
    Column() {
      Column() {
        WithTheme({colorMode: null}) {
          Column() {
            Text('WithTheme={null}')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.Red)
              .fontStyle(FontStyle.Italic)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height('20%')
          .backgroundColor($r('sys.color.background_primary'))
        }
        WithTheme({colorMode: undefined}) {
          Column() {
            Text('WithTheme={undefined}')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.Red)
              .fontStyle(FontStyle.Italic)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height('20%')
          .backgroundColor($r('sys.color.background_primary'))
        }
        Button('change colormodeto dark')
          .onClick(()=>{
            try {
              uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK).then(() => {
                console.info('Set dark-mode successfully.');
              }).catch((error:Error) => {
                console.error('Set dark-mode failed, ' + error.message);
              });
            } catch (error) {
              let message = (error as BusinessError).message;
              console.error('Set dark-mode failed, ' + message);
            }
          })
          .id('UiComponentTextWithTheme08_01')
        Button('change colormodeto light')
          .onClick(()=>{
            try {
              uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT).then(() => {
                console.info('Set dark-mode successfully.');
              }).catch((error:Error) => {
                console.error('Set dark-mode failed, ' + error.message);
              });
            } catch (error) {
              let message = (error as BusinessError).message;
              console.error('Set dark-mode failed, ' + message);
            }
          })
          .id('UiComponentTextWithTheme08_02')
      }
      .height('100%')
      .expandSafeArea([SafeAreaType.SYSTEM],
        [SafeAreaEdge.TOP, SafeAreaEdge.END, SafeAreaEdge.BOTTOM, SafeAreaEdge.START])
    }
  }
}
