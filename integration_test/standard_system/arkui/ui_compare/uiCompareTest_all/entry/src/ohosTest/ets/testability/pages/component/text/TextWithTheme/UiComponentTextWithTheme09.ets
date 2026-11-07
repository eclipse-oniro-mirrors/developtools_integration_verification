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
struct UiComponentTextWithTheme09 {
  textinputController: TextInputController = new TextInputController();
  @State colorMode :ThemeColorMode = ThemeColorMode.LIGHT
  @Builder
  itemEnd() {
    Select([{ value: 'KB' },
      { value: 'MB' },
      { value: 'GB' },
      { value: 'TB', }])
      .height('48vp')
      .borderRadius(0)
      .selected(2)
      .align(Alignment.Center)
      .value('MB')
      .font({ size: 20, weight: 500 })
      .fontColor('#182431')
      .selectedOptionFont({ size: 20, weight: 400 })
      .optionFont({ size: 20, weight: 400 })
      .backgroundColor(Color.Transparent)
      .responseRegion({
        height: '40vp',
        width: '80%',
        x: '10%',
        y: '6vp'
      })
      .onSelect((index: number) => {
        console.info('Select:' + index);
      })
  }
  build() {
    Column() {
      Column() {
        WithTheme({colorMode: this.colorMode}) {
          Column() {
            TextInput({ text: 'withtheme', placeholder: 'input your word...', controller: this.textinputController })
              .placeholderColor(Color.Grey)
              .placeholderFont({ size: 14, weight: 400 })
              .caretColor(Color.Blue)
              .width('95%')
              .height(50)
              .margin(20)
              .style(TextContentStyle.DEFAULT)
              .fontSize(14)
              .showUnit(this.itemEnd)
              .selectedBackgroundColor('0%')
              .style(TextInputStyle.Inline)
              .showUnderline(true)
              .fontColor(Color.Black)
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height('20%')
          .backgroundColor($r('sys.color.background_primary'))
        }
        Button('change colormodeto dark')
          .onClick(()=>{
            this.colorMode = this.colorMode === ThemeColorMode.DARK
              ? ThemeColorMode.LIGHT
              : ThemeColorMode.DARK;
          })
          .id('UiComponentTextWithTheme09_01')
      }
      .height('100%')
      .expandSafeArea([SafeAreaType.SYSTEM],
        [SafeAreaEdge.TOP, SafeAreaEdge.END, SafeAreaEdge.BOTTOM, SafeAreaEdge.START])
    }
  }
}
