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
struct MediaTextpickerDisabletsa01 {
  @State selectedValue: string = ''
  private timerId: number = 0

  // 防抖处理函数
  private debounceSelect(value: string) {
    clearTimeout(this.timerId)
    this.timerId = setTimeout(() => {
      this.selectedValue = value
      console.log('Final selection:', value)
    }, 300) // 300ms防抖间隔
  }

  build() {
    Column() {
      TimePicker()
        .id('MediaTextpickerDisabletsa01')
        .onEnterSelectedArea(() => {

        })

      Text('Selected: ' + this.selectedValue)
    }
  }
}