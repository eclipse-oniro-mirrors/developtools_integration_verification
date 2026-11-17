/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct UiComponentMediaCalendarPickerDisabledDate0020 {
  @State resultText: string = 'idle'
  build() {
    Column({ space: 16 }) {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_CAlENDARPICKER_DISABLEDDATE_0020')
        .fontSize(12)
        .id('case_title_0020')
      Button('null')
        .id('calendarpicker_null_btn')
        .onClick(() => {
          this.resultText = 'disabledDateRange_null_applied'
        })
      Text(this.resultText)
        .id('assert_result_0020')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding(24)
    .justifyContent(FlexAlign.Center)
  }
}
