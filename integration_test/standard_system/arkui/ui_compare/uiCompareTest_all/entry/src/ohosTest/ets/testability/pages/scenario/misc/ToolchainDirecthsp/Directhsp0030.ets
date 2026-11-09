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

/**
 * HSP颜色资源访问
 * SUB_ACE_TOOLCHAIN_DIRECTHSP_0030
 */
@Entry
@ComponentV2
export struct Directhsp0030 {

  build() {
    Scroll() {
      Column() {
        Text('HSP颜色资源访问')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Text('SUB_ACE_TOOLCHAIN_DIRECTHSP_0030')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 15 })

        Text('HSP资源访问区域')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Column() {
        Text($r('[hsp].string.test_string'))
          .fontSize(14)
          .fontColor($r('[hsp].color.font_color'))
        }
        .width('90%')
        .height('6.56%')
        .backgroundColor('#F5F5F5')
        .justifyContent(FlexAlign.Center)
        .borderRadius(5)
        .margin({ bottom: 15 })

        Button('测试完成')
          .id('btn')
          .width('80%')
          .onClick(() => {})
          .margin({ bottom: 15 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('字体颜色为红色')
          .fontSize(10)
          .fontColor('#FF6B35')
          .width('95%')
          .margin({ bottom: 10 })

        Text('注：需配置HSP模块，[hsp]替换为实际模块名')
          .fontSize(9)
          .fontColor('#999')
          .width('95%')
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}
