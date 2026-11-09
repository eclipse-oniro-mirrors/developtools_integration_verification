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
struct PreviewContainer0150 {
  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Text('First child, show in Top').width('90%').height('100%').backgroundColor(0xd2cab3).align(Alignment.Top)
      Text('Second child, show in Bottom').width('70%').height('60%').backgroundColor(0xc1cbac).align(Alignment.Bottom)
      Text('Third child, show in Center').width('50%').height('40%').backgroundColor(0xc1cafc).align(Alignment.Center)
    }.width('100%').height('100%').margin({ top: 5 })
  }
}

