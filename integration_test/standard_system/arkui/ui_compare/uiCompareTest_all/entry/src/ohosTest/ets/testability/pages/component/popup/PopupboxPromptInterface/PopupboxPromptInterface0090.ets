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
struct PopupboxPromptInterface0090 {
  build() {
    Column({ space: 20 }) {
      Text('showActionMenu text参数验证')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text('text参数不传入会导致编译报错')
        .fontSize(16)
        .fontColor(Color.Gray)

      // 以下代码取消注释会导致编译报错，因为text是必填参数
      // this.getUIContext().getPromptAction().showActionMenu({
      //   title: 'Title',
      //   buttons: [
      //     {
      //       // text参数不传入 - 编译报错
      //       color: '#000000'
      //     }
      //   ]
      // })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
