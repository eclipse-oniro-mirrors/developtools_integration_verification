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
struct BadgeImage02 {
  build() {
    Column({ space: 20 }) {
      Text('Badge组件包含Image焦点测试-Tab键方式')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // 外部Image
      Image($r('sys.media.ohos_ic_public_cut'))
        .id('outer_image')
        .width(80)
        .height(80)
        .borderRadius(8)
        .focusable(true)

      // Badge组件包含内部Image
      Badge({ count: 3, style: { badgeSize: 16, badgeColor: Color.Red } }) {
        Image($r('sys.media.ohos_ic_public_cut'))
          .id('inner_image')
          .width(80)
          .height(80)
          .borderRadius(8)
          .focusable(true)
      }
        .id('badge_wrapper')

      Text('预期效果：先外部图片获焦再内部图片获焦')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F3F4F6')
  }
}
