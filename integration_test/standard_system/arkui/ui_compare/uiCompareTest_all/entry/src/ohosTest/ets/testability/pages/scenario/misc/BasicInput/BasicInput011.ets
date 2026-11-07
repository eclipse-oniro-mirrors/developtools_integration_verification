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
 * 测试用例：Ace_JSDeclarativeParadigm_Component_Basic_Input_011
 * 测试目的：测试长文本框删除字符
 * 预期结果：可以正常删除字符，字符计数正确
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct BasicInput011 {
  @Local textValue: string = '这是一段用于测试删除功能的长文本内容。请尝试删除部分字符，系统会实时显示字符数量的变化。您可以使用退格键删除字符，也可以选中部分文本后删除。';
  @Local charCount: number = 0;
  @Local deletedCount: number = 0;
  @Local testStatus: string = '待测试';

  aboutToAppear() {
    this.charCount = this.textValue.length;
  }

  build() {
    Column({ space: 15 }) {
      Text('Ace_JSDeclarativeParadigm_Component_Basic_Input_011')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      Text('测试：长文本框删除字符')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      // 字符统计
      Column({ space: 8 }) {
        Row({ space: 20 }) {
          Column({ space: 5 }) {
            Text('当前字符数')
              .fontSize(11)
              .fontColor(Color.Gray)
            Text(`${this.charCount}`)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.Blue)
          }

          Column({ space: 5 }) {
            Text('已删除字符')
              .fontSize(11)
              .fontColor(Color.Gray)
            Text(`${this.deletedCount}`)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.Red)
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#E3F2FD')
      .borderRadius(8)

      // 长文本输入框
      Column({ space: 8 }) {
        Text('长文本输入框（尝试删除字符）：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        TextInput({ text: this.textValue })
          .id('longTextInput')
          .width('100%')
          .height(100)
          .maxLength(500)
          .fontSize(14)
          .borderRadius(8)
          .borderWidth(1)
          .borderColor('#007AFF')
          .onChange((value: string) => {
            const oldLength = this.charCount;
            this.charCount = value.length;
            
            if (value.length < oldLength) {
              this.deletedCount += (oldLength - value.length);
              this.testStatus = `删除了 ${oldLength - value.length} 个字符`;
              hilog.info(0x0000, 'testTag', `Deleted ${oldLength - value.length} chars`);
            } else if (value.length > oldLength) {
              this.testStatus = `添加了 ${value.length - oldLength} 个字符`;
            }
            
            this.textValue = value;
          })
      }
      .width('100%')

      Divider()

      // 操作按钮
      Row({ space: 10 }) {
        Button('全部清空')
          .id('clearBtn')
          .backgroundColor('#FF6B6B')
          .onClick(() => {
            this.deletedCount += this.charCount;
            this.textValue = '';
            this.charCount = 0;
            this.testStatus = '已清空所有字符';
            hilog.info(0x0000, 'testTag', 'All text cleared');
          })

        Button('重置文本')
          .id('resetBtn')
          .backgroundColor('#4CAF50')
          .onClick(() => {
            this.textValue = '这是一段用于测试删除功能的长文本内容。请尝试删除部分字符，系统会实时显示字符数量的变化。您可以使用退格键删除字符，也可以选中部分文本后删除。';
            this.charCount = this.textValue.length;
            this.deletedCount = 0;
            this.testStatus = '已重置';
            hilog.info(0x0000, 'testTag', 'Text reset');
          })
      }

      Divider()

      // 测试说明
      Column({ space: 8 }) {
        Text('测试步骤：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. 点击输入框，使用退格键删除字符')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('2. 观察字符计数实时变化')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('3. 尝试选中部分文本后删除')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('4. 点击"全部清空"测试批量删除')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      Text(`状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      // 预期结果
      Text('预期结果：可以正常删除字符，字符计数正确')
        .fontSize(13)
        .fontColor(Color.Green)
        .padding(8)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

