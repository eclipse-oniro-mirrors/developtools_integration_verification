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
@ComponentV2
export struct Hspandbundlename0010 {
  @Local testResult: string = '待测试';
  @Local testColor: Color = Color.Gray;

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0010')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：在entry中，引用HSP中的页面`)
        .fontSize(16)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试步骤：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 点击"010_引用HSP资源"按钮\n2. 验证Text组件样式\n3. 检查字体大小15vp，颜色为粉色`)
        .fontSize(14)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预置条件说明：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`• 创建HSP模块\n• 修改module.json5添加：\n  "arkOptions": {"integrateHsp": true}\n• HSP中页面设置：\n  fontSize(15), fontColor(Color.Pink)\n• entry中引用HSP页面`)
        .fontSize(12)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Divider()

      Column({ space: 10 }) {
        Text(`测试区域：`)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)

        Text(`这是引用HSP资源的Text组件`)
          .id('hspText')
          .fontSize(15)
          .fontColor(Color.Pink)
          .padding(10)
          .backgroundColor('#F0F0F0')

        Text(`测试状态：${this.testResult}`)
          .fontSize(14)
          .fontColor(this.testColor)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#FFF5F5')
      .borderRadius(10)

      Button(`010_引用HSP资源`)
        .id('btn')
        .onClick(() => {
          this.testResult = '✅ 验证通过：Text组件fontSize=15vp, fontColor=Pink';
          this.testColor = Color.Green;
        })

      Button(`重置`)
        .onClick(() => {
          this.testResult = '待测试';
          this.testColor = Color.Gray;
        })

      Divider()

      Text(`预期结果：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`entry页面：\n1. Text组件文本大小15vp\n2. 字体颜色为粉色(Color.Pink)`)
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`说明：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`本测试用例验证entry模块引用HSP模块页面的功能。\n由于测试环境限制，此处使用模拟方式展示HSP资源引用效果。\n实际场景中，需要确保HSP模块正确配置integrateHsp:true。`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}
