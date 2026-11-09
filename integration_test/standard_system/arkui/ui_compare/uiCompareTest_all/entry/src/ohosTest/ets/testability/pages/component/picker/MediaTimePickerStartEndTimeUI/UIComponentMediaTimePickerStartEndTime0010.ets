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
struct UIComponentMediaTimePickerStartEndTime0010 {
  @State name: string = 'UIComponentMediaTimePickerStartEndTime0010';
  @State message: string = 'message';
  @State cascadeFlag: boolean | undefined | null = true;
  private selectedTime: Date = new Date('2024-12-20T09:00:00');
  private startTime: Date = new Date('2024-12-20T09:00:00');
  private endTime: Date = new Date('2024-12-20T21:00:00');

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

      TimePicker({
        selected: this.selectedTime,
        start: this.startTime,
        end: this.endTime
      })
        .id(this.name + '_01')
        .enableCascade(this.cascadeFlag)
        .useMilitaryTime(true)
        .loop(true)
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectedTime.setHours(value.hour, value.minute);
            console.info('select current date is: ' + JSON.stringify(value));
          }
        })

      Button('ShowTimePickerDialog')
        .margin(20)
        .id(this.name + '_02')
        .onClick(() => {
          this.getUIContext().showTimePickerDialog({
            useMilitaryTime: true,
            selected: this.selectedTime,
            start: this.startTime,
            end: this.endTime,
            enableCascade: this.cascadeFlag,
            onAccept: (value: TimePickerResult) => {
              if (value.hour != undefined && value.minute != undefined) {
                this.selectedTime.setHours(value.hour, value.minute);
                console.info('TimePickerDialog:onAccept()' + JSON.stringify(value));
              }
            }
          });
        })

    }
    .width('100%')
    .height('100%')
    .id(this.name + '_03')
  }
}
