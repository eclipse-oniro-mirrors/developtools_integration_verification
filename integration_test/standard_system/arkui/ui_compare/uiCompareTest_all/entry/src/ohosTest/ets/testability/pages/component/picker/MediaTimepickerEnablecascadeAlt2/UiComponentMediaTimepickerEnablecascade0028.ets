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

@Entry
@Component
struct UiComponentMediaTimepickerEnablecascade0028 {
  @State isMilitaryTime:boolean =true;
  @State private selectedTime: Date = new Date('2022-07-22T08:00:00');
  build() {
    Row() {
      Column() {
        TimePicker({ selected: this.selectedTime })
          .enableCascade(false)
          .useMilitaryTime(this.isMilitaryTime)
          .id('UiComponentMediaTimepickerEnablecascade0028_001')
        Button('12小时制/24小时制')
          .id('UiComponentMediaTimepickerEnablecascade0028_002')
          .onClick(()=>{
            this.isMilitaryTime=!this.isMilitaryTime;
          })
        Button('初始化时间”-12:00:00')
          .id('UiComponentMediaTimepickerEnablecascade0028_003')
          .onClick(()=>{
            this.selectedTime=new Date('2022-07-22T12:00:00');
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
