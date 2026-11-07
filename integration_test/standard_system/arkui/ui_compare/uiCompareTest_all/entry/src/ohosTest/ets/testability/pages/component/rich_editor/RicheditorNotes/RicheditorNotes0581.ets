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
 * 测试用例：SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_581
 * 测试目的：验证备忘录小窗模式下，清单圆圈以及列表圆圈是否正常
 * 预置条件：新建备忘录
 * 预期结果：清单圆圈以及列表圆圈正常
 */

@Entry
@ComponentV2
export struct RicheditorNotes0581 {
  private richEditorController: RichEditorController = new RichEditorController();
  @Local testStatus: string = '待测试';
  @Local isSmallWindow: boolean = false;

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_581')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      Text('测试：备忘录小窗模式清单/列表圆圈')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      // 窗口模式模拟
      Row({ space: 10 }) {
        Text('窗口模式：')
          .fontSize(14)
        Text(this.isSmallWindow ? '小窗模式' : '全屏模式')
          .fontSize(14)
          .fontColor(this.isSmallWindow ? Color.Orange : Color.Blue)
          .fontWeight(FontWeight.Bold)
      }

      Row({ space: 10 }) {
        Button('全屏模式')
          .id('fullScreenBtn')
          .backgroundColor(!this.isSmallWindow ? '#007AFF' : '#CCCCCC')
          .onClick(() => {
            this.isSmallWindow = false;
          })

        Button('小窗模式')
          .id('smallWindowBtn')
          .backgroundColor(this.isSmallWindow ? '#007AFF' : '#CCCCCC')
          .onClick(() => {
            this.isSmallWindow = true;
          })
      }

      Divider()

      // RichEditor模拟备忘录（根据窗口模式调整大小）
      Column({ space: 8 }) {
        Text('RichEditor（观察清单/列表圆圈）：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        // 清单示例
        Column({ space: 5 }) {
          Text('清单示例：')
            .fontSize(11)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)

          Row({ space: 8 }) {
            // 清单圆圈
            Circle()
              .width(16)
              .height(16)
              .stroke('#007AFF')
              .strokeWidth(2)
              .fill(Color.Transparent)

            Text('清单项目1（未完成）')
              .fontSize(13)
          }
          .alignItems(VerticalAlign.Center)

          Row({ space: 8 }) {
            // 已完成清单圆圈
            Circle()
              .width(16)
              .height(16)
              .fill('#007AFF')

            Text('清单项目2（已完成）')
              .fontSize(13)
              .decoration({ type: TextDecorationType.LineThrough })
              .fontColor(Color.Gray)
          }
          .alignItems(VerticalAlign.Center)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)

        // 列表示例
        Column({ space: 5 }) {
          Text('列表示例：')
            .fontSize(11)
            .fontColor(Color.Gray)
            .alignSelf(ItemAlign.Start)

          Row({ space: 8 }) {
            // 列表圆圈
            Circle()
              .width(8)
              .height(8)
              .fill('#333333')

            Text('列表项目1')
              .fontSize(13)
          }
          .alignItems(VerticalAlign.Center)

          Row({ space: 8 }) {
            Circle()
              .width(8)
              .height(8)
              .fill('#333333')

            Text('列表项目2')
              .fontSize(13)
          }
          .alignItems(VerticalAlign.Center)

          Row({ space: 8 }) {
            Circle()
              .width(8)
              .height(8)
              .fill('#333333')

            Text('列表项目3')
              .fontSize(13)
          }
          .alignItems(VerticalAlign.Center)
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)

        // RichEditor
        RichEditor({ controller: this.richEditorController })
          .id('richEditor')
          .width(this.isSmallWindow ? '70%' : '100%')
          .height(this.isSmallWindow ? 100 : 120)
          .backgroundColor(Color.White)
          .borderRadius(8)
          .borderWidth(1)
          .borderColor('#CCCCCC')
          .onReady(() => {
            this.richEditorController.addTextSpan('在此输入备忘录内容...', {
              style: {
                fontSize: 14,
                fontColor: Color.Gray
              }
            });
          })
      }
      .width('100%')

      Divider()

      // 测试步骤
      Column({ space: 8 }) {
        Text('测试步骤：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. 切换到小窗模式')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('2. 观察清单圆圈（空心/实心）是否正常显示')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('3. 观察列表圆圈是否正常显示')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      // 确认按钮
      Button('确认圆圈显示正常')
        .id('confirmBtn')
        .width('80%')
        .onClick(() => {
          this.testStatus = '✅ 清单圆圈以及列表圆圈正常';
        })

      Text(`状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(this.testStatus.includes('✅') ? Color.Green : Color.Blue)

      // 预期结果
      Text('预期结果：清单圆圈以及列表圆圈正常')
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

