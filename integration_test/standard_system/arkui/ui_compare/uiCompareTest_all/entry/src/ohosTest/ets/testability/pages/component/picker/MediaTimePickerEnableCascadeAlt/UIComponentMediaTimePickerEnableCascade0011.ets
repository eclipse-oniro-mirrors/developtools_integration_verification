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
struct UIComponentMediaTimePickerEnableCascade0011 {
  @State name: string = 'UIComponentMediaTimePickerEnableCascade0011';
  @State message: string = 'message';
  @State cascadeFlag: boolean | undefined | null = true;

  private selectedTime: Date = new Date('2025-01-01T11:00:00');

  build() {
    Column() {
      TimePicker({
        selected: this.selectedTime,
      })
        .id(this.name + '_01')
        .enableCascade(this.cascadeFlag)
        .loop(true)
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectedTime.setHours(value.hour, value.minute);
            console.info('select current date is: ' + JSON.stringify(value));
          }
        })

      Text('enableCascade值为: ' + JSON.stringify(this.cascadeFlag))
        .margin({top: 20})
      Button('切换enableCascade值-false')
        .id(this.name + '_02')
        .onClick(() => {
          this.cascadeFlag = false;
        })
        .margin({bottom: 10})
    }.width('100%')
  }
}
