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

@ComponentV2
struct TextPickerDialog001 {
  private select: number | number[] = 0;
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5'];
  private v: string = '';

  build() {
    Column() {
      Button('TextPickerDialog:' + this.v)
        .id('TextPickerDialog')
        .margin(20)
        .onClick(() => {
          this.getUIContext().showTextPickerDialog({
            range: this.fruits,
            selected: this.select,
            disappearTextStyle: { color: '#297bec', font: { size: 15, weight: FontWeight.Lighter } },
            textStyle: { color: Color.Green, font: { size: 20, weight: FontWeight.Normal } },
            selectedTextStyle: { color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } },
            onAccept: (value: TextPickerResult) => {
              this.select = value.index;
              console.log(this.select + '');
              this.v = value.value as string;
              console.info('TextPickerDialog:onAccept()' + JSON.stringify(value));
            },
            onChange: (value: TextPickerResult) => {
              console.info('TextPickerDialog:onChange()' + JSON.stringify(value));
            },
            onScrollStop: (value: TextPickerResult) => {
              console.info('TextPickerDialog:onScrollStop()' + JSON.stringify(value));
            }
          });
        })
    }
    .justifyContent(FlexAlign.Center)
  }
}

@Entry
@ComponentV2
struct StatusManagerV2WithTheme001 {
  build() {
    Column() {
      WithTheme({ colorMode: ThemeColorMode.DARK }) {
        TextPickerDialog001().backgroundColor($r('sys.color.background_primary'))
      }
      Column() {
        Button('dark')
          .id('dark')
          .fontSize(30)
          .stateEffect(true)
          .margin(10)
          .onClick(() => {
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
        Button('light')
          .id('light')
          .fontSize(30)
          .stateEffect(true)
          .margin(10)
          .onClick(() => {
            try {
              uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT).then(() => {
                console.info('Set light-mode successfully.');
              }).catch((error:Error) => {
                console.error('Set light-mode failed, ' + error.message);
              });
            } catch (error) {
              let message = (error as BusinessError).message;
              console.error('Set light-mode failed, ' + message);
            }
          })
      }
      .id('screen')
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .margin({ top: 20 })
    }
    .justifyContent(FlexAlign.Center)
  }
}