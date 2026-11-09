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

@Entry
@Component
struct UiComponentTextWithTheme06 {
  build() {
    Column() {
      Column() {
        WithTheme({ colorMode: ThemeColorMode.DARK }) {
          Column() {
            Text('WithTheme')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
            Text('DARK')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height('20%')
          .backgroundColor($r('sys.color.background_primary'))
        }

        WithTheme({ colorMode: ThemeColorMode.LIGHT }) {
          Column() {
            Text('WithTheme')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
            Text('LIGHT')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height('20%')
          .backgroundColor($r('sys.color.background_primary'))
        }

        WithTheme({ colorMode: ThemeColorMode.SYSTEM }) {
          Column() {
            Text('WithTheme')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
            Text('DARK system')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height('20%')
          .backgroundColor($r('sys.color.background_primary'))
        }
      }
      .height('100%')
      .expandSafeArea([SafeAreaType.SYSTEM],
        [SafeAreaEdge.TOP, SafeAreaEdge.END, SafeAreaEdge.BOTTOM, SafeAreaEdge.START])
    }
  }
}
