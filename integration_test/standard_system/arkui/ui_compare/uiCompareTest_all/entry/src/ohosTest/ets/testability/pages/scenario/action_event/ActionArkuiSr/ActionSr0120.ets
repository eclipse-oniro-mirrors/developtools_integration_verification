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
export struct ActionSr0120 {
  @Local clickCount: number = 0;
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_ACTION_ARKUI_SR20250106997626_0120')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：单手模式点击事件Dump`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Column({ space: 15 }) {
        Text(`点击次数：${this.clickCount}`)
          .fontSize(16)
          .fontColor(Color.Blue)

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Orange)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F0F0F0')
      .borderRadius(10)

      Button(`点击按钮`)
        .id('btn')
        .onClick(() => {
          this.clickCount++;
          this.testStatus = `✅ 第${this.clickCount}次点击事件已记录`;
        })

      Button(`重置`)
        .onClick(() => {
          this.clickCount = 0;
          this.testStatus = '待测试';
        })

      Divider()

      Text(`测试步骤：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 执行hdc shell hidumper -s WindowManagerService -a '-a' 获取当前windowId\n2. 进入hap，点击页面按钮\n3. 执行hdc shell "hidumper -s WindowManagerService -a '-w windowId -event'" Dump事件信息\n4. 重复步骤2-3`)
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：dump响应事件正确，页面树信息无问题，最多存储5次事件，第六次进来时会删掉第一次，以此类推`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

