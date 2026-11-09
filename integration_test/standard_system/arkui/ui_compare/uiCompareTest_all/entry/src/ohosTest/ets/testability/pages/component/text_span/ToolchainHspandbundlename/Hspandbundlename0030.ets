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
export struct Hspandbundlename0030 {
  @Local testResult: string = '待测试';
  @Local testColor: Color = Color.Orange;

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0030')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：在entry中引用HSP页面，integrateHsp为空（预期编译报错）`)
        .fontSize(16)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试步骤：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 编译hap和hsp\n2. 观察编译结果\n3. 验证编译报错`)
        .fontSize(14)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预置条件说明：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`• 创建HSP模块\n• 修改module.json5添加：\n  "arkOptions": {"integrateHsp": }\n  （注意：integrateHsp的值为空）\n• HSP中页面设置：\n  fontSize(15), fontColor(Color.Pink)\n• entry中引用HSP页面`)
        .fontSize(12)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Divider()

      Column({ space: 10 }) {
        Text(`⚠️ 此用例为编译错误测试`)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Red)

        Text(`预期行为：`)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10 })

        Text(`当integrateHsp配置为空值时，编译过程应该报错，阻止构建成功。\n\n这是一个负面测试用例，用于验证编译器对配置错误的检测能力。`)
          .fontSize(14)
          .fontColor(Color.Gray)

        Text(`当前页面说明：`)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 15 })

        Text(`此页面能够成功加载，说明当前配置可能已修正为有效值。\n原始测试意图是验证无效配置下的编译行为。`)
          .fontSize(14)
          .fontColor(Color.Blue)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#FFF5E5')
      .borderRadius(10)

      Button(`查看测试说明`)
        .id('btn')
        .onClick(() => {
          this.testResult = '⚠️ 注意：此为编译错误验证用例，需在配置阶段测试';
          this.testColor = Color.Orange;
        })

      Text(`测试状态：${this.testResult}`)
        .fontSize(14)
        .fontColor(this.testColor)
        .margin({ top: 10 })

      Divider()

      Text(`预期结果：`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`编译报错（配置项integrateHsp值不能为空）`)
        .fontSize(14)
        .fontColor(Color.Red)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`说明：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`本测试为负面测试用例，验证编译器对错误配置的检测。\n如果此页面能够显示，说明配置已被修正。`)
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

