/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UiComponentTextRichEditorHandleAnimation04 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State componentWidth: string = '90%';
  @State componentHeight: number = 150;
  @State isAnimating: boolean = false;

  // 执行尺寸变化动画
  startSizeChangeAnimation() {
    this.isAnimating = true;
    animateTo({
      duration: 2000,
      curve: Curve.EaseInOut,
      iterations: 1,
      onFinish: () => {
        this.isAnimating = false;
      }
    }, () => {
      this.componentWidth = '70%';
      this.componentHeight = 200;
    });
  }

  // 重置尺寸
  resetSize() {
    animateTo({
      duration: 1000,
      curve: Curve.EaseInOut
    }, () => {
      this.componentWidth = '90%';
      this.componentHeight = 150;
    });
  }

  build() {
    Scroll() {
      Column() {
        // 标题区域
        Column() {
          Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle-animation_0006')
            .fontSize(9)
            .fontWeight(FontWeight.Bold)
            .fontColor('#007DFF')
            .textAlign(TextAlign.Center)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .width('100%')
        .padding({ top: 4, bottom: 4, left: 8, right: 8 })
        .backgroundColor('#E6F2FD')
        .borderRadius(4)
        .margin({ bottom: 4 })
        .alignItems(HorizontalAlign.Center)

        // 测试配置
        Column({ space: 1 }) {
          Text('测试配置')
            .fontSize(8)
            .fontWeight(FontWeight.Medium)
            .fontColor('#E65100')
            .alignSelf(ItemAlign.Start)

          Text('组件: RichEditor')
            .fontSize(7)
            .fontColor('#66182431')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)

          Text('测试内容: 尺寸变化动画时手柄和菜单表现')
            .fontSize(7)
            .fontColor('#66182431')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)

          Text('动画参数: duration=2000ms, width: 90%→70%, height: 150→200')
            .fontSize(7)
            .fontColor('#E84026')
            .fontWeight(FontWeight.Medium)
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)
        }
        .width('92%')
        .padding({ top: 6, bottom: 6, left: 10, right: 10 })
        .backgroundColor('#FFF5F0')
        .borderRadius(4)
        .alignItems(HorizontalAlign.Start)
        .margin({ bottom: 4 })

        // 测试组件区域
        Column({ space: 8 }) {
          Text('RichEditor 组件（图文混排）')
            .fontSize(9)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')

          // RichEditor组件
          RichEditor(this.options)
            .id('UiComponentTextRichEditorHandleAnimation04')
            .onReady(() => {
              // 添加文本内容
              this.controller.addTextSpan('这是一段测试文本，这是一段测试文本这是一段测试文本这是一段测试文本', {
                style: {
                  fontColor: Color.Black,
                  fontSize: 16
                }
              });

              // 添加图片（使用系统图标）
              this.controller.addImageSpan($r('sys.media.ohos_ic_public_clock'), {
                imageStyle: {
                  size: ['30vp', '30vp'],
                  verticalAlign: ImageSpanAlignment.CENTER
                }
              });

              // 继续添加文本
              this.controller.addTextSpan(' 包含图片和文字混排。', {
                style: {
                  fontColor: Color.Black,
                  fontSize: 16
                }
              });

              // 添加换行
              this.controller.addTextSpan('\n', {
                style: {
                  fontColor: Color.Black,
                  fontSize: 16
                }
              });

              // 添加更多内容
              this.controller.addTextSpan('请长按选中一段内容，', {
                style: {
                  fontColor: Color.Blue,
                  fontSize: 16,
                  fontWeight: FontWeight.Bold
                }
              });

              this.controller.addTextSpan('然后点击下方按钮执行尺寸变化动画。', {
                style: {
                  fontColor: Color.Red,
                  fontSize: 16,
                  fontWeight: FontWeight.Medium
                }
              });
            })
            .width(this.componentWidth)
            .height(this.componentHeight)
            .borderWidth(2)
            .borderColor('#007DFF')
            .borderRadius(8)
            .padding(10)
            .backgroundColor(Color.White)
            .copyOptions(CopyOptions.InApp)

          Text('长按文本选中内容，观察手柄和菜单')
            .fontSize(7)
            .fontColor('#666666')
            .textAlign(TextAlign.Center)
        }
        .width('100%')
        .padding({ top: 8, bottom: 8 })
        .alignItems(HorizontalAlign.Center)

        Column({ space: 10 }) {
          Row({ space: 15 }) {
            Button('执行尺寸变化')
              .fontSize(9)
              .width(140)
              .id('UiComponentTextRichEditorHandleAnimation04_02')
              .height(40)
              .backgroundColor('#007DFF')
              .enabled(!this.isAnimating)
              .onClick(() => {
                this.startSizeChangeAnimation();
              })

            Button('重置尺寸')
              .fontSize(9)
              .width(100)
              .height(40)
              .backgroundColor('#FF6F00')
              .enabled(!this.isAnimating && this.componentWidth !== '90%')
              .onClick(() => {
                this.resetSize();
              })
          }
          .justifyContent(FlexAlign.Center)
        }
        .width('100%')
        .padding({ top: 8, bottom: 8 })
        .alignItems(HorizontalAlign.Center)

        Divider()
          .strokeWidth(1)
          .color('#E0E0E0')
          .margin({ top: 6, bottom: 6 })

        // 预期效果
        Column({ space: 1 }) {
          Text('预期效果')
            .fontSize(8)
            .fontWeight(FontWeight.Medium)
            .fontColor('#2E7D32')
            .alignSelf(ItemAlign.Start)

          Text('✓ 手柄跟随组件一起做尺寸变化动画')
            .fontSize(7)
            .fontColor('#388E3C')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)

          Text('✓ 菜单在动画过程中隐藏')
            .fontSize(7)
            .fontColor('#388E3C')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)

          Text('✓ 手柄位置随组件尺寸自动调整')
            .fontSize(7)
            .fontColor('#388E3C')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)

          Text('✓ 动画结束后，手柄和菜单恢复正常')
            .fontSize(7)
            .fontColor('#388E3C')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)
        }
        .width('92%')
        .padding({ top: 6, bottom: 6, left: 10, right: 10 })
        .backgroundColor('#E8F5E9')
        .borderRadius(4)
        .alignItems(HorizontalAlign.Start)
        .margin({ bottom: 4 })

        // 操作步骤说明
        Column({ space: 4 }) {
          Text('操作步骤')
            .fontSize(8)
            .fontWeight(FontWeight.Bold)
            .fontColor('#D32F2F')
            .alignSelf(ItemAlign.Start)

          Text('步骤1: 长按RichEditor中的文本内容')
            .fontSize(7)
            .fontColor('#666666')
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤2: 拖动手柄选中一段内容（图文混排）')
            .fontSize(7)
            .fontColor('#666666')
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤3: 观察选中后显示的手柄和菜单')
            .fontSize(7)
            .fontColor('#666666')
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤4: 点击 "执行尺寸变化" 按钮')
            .fontSize(7)
            .fontColor('#666666')
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤5: 观察动画过程中手柄和菜单的表现')
            .fontSize(7)
            .fontColor('#666666')
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤6: 验证手柄是否随尺寸调整，菜单是否隐藏')
            .fontSize(7)
            .fontColor('#2E7D32')
            .fontWeight(FontWeight.Medium)
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤7: 动画结束后，点击 "重置尺寸" 返回初始状态')
            .fontSize(7)
            .fontColor('#666666')
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)
        }
        .width('92%')
        .padding(10)
        .backgroundColor('#FFEBEE')
        .borderRadius(4)
        .margin({ top: 8, bottom: 10 })
        .alignItems(HorizontalAlign.Start)

        // 注意事项
        Column({ space: 3 }) {
          Text('注意事项')
            .fontSize(8)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF6F00')
            .alignSelf(ItemAlign.Start)

          Text('• 需要先选中文本内容才会显示手柄')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 动画执行时，组件宽度从90%变为70%')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 组件高度从150vp增加到200vp')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 尺寸变化动画中，选择菜单会自动隐藏')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 动画时长2秒，曲线为EaseInOut')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 可通过重置按钮恢复到初始尺寸')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)
        }
        .width('92%')
        .padding(8)
        .backgroundColor('#FFF8E1')
        .borderRadius(4)
        .margin({ bottom: 15 })
      }
      .width('100%')
      .padding({ left: 8, right: 8, top: 6, bottom: 6 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .scrollBar(BarState.Auto)
  }
}

