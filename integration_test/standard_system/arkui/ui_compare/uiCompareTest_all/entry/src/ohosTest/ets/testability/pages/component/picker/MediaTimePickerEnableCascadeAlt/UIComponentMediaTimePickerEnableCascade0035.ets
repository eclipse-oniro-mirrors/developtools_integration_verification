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
struct UIComponentMediaTimePickerEnableCascade0035 {
  @State name: string = 'UIComponentMediaTimePickerEnableCascade0035';
  @State message: string = 'message';
  @State cascadeFlag: boolean | undefined | null = true;
  private selectedTime: Date = new Date('2025-01-01T11:00:00');

  onPageShow(): void {
    let fontScale = 1;
    try {
      uiAppearance.setFontScale(fontScale).then(() => {
        this.message = `Set fontScale successfully as ${fontScale}.`
      }).catch((err: Error) => {
        this.message = `Set fontScale failed. err: ${JSON.stringify(err)}, ${err.message}`;
      });
    } catch (paramErr) {
      this.message = `Set fontScale failed. paramErr: ${JSON.stringify(paramErr)}, ${paramErr.message}`;
    }
  }

  build() {
    Column() {

      Button('ShowTimePickerDialog')
        .margin(20)
        .id(this.name + '_01')
        .onClick(() => {
          this.getUIContext().showTimePickerDialog({
            useMilitaryTime: false,
            selected: this.selectedTime,
            enableCascade: this.cascadeFlag,
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined) {
                this.selectedTime.setHours(value.hour, value.minute);
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value));
              }
            }
          });
        })

      Text('enableCascade值为: ' + JSON.stringify(this.cascadeFlag))
        .margin({top: 20})
      Button('切换enableCascade值-false')
        .id(this.name + '_02')
        .onClick(() => {
          this.cascadeFlag = false;
        })
        .margin({bottom: 10})
    }
    .width('100%')
    .height('100%')
    .id(this.name + '_03')
  }
}
