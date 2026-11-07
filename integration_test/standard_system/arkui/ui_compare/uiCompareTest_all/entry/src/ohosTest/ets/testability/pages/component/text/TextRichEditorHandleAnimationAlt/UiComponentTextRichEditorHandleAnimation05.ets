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

@Builder
function placeholderBuilder1() {
  Row({ space: 2 }) {
    Image($r('sys.media.ohos_ic_public_clock')).width(5).height(5).margin({ left: -5 })
    Text('Builder1').fontSize(10)
  }.width('100%').height('100%').padding(5).backgroundColor('#FF6B35').borderRadius(4)
}

@Entry
@Component
struct UiComponentTextRichEditorHandleAnimation05 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State rotateAngle: number = 0;
  @State scaleValue: number = 1;
  @State componentWidth: string = '90%';
  @State componentHeight: number = 150;
  @State isAnimating: boolean = false;
  @State currentAnimation: string = '平移';
  private my_offset: number | undefined = undefined;
  private my_builder: CustomBuilder = undefined;
  @BuilderParam my_builder2:() => void = placeholderBuilder1;

  // 执行平移动画
  startTranslateAnimation() {
    this.currentAnimation = '平移';
    this.isAnimating = true;
    animateTo({
      duration: 200,
      curve: Curve.EaseInOut,
      iterations: 1,
      onFinish: () => {
        this.isAnimating = false;
      }
    }, () => {
      this.offsetX = 80;
      this.offsetY = 10;
    });
  }

  // 执行旋转动画
  startRotateAnimation() {
    this.currentAnimation = '旋转';
    this.isAnimating = true;
    animateTo({
      duration: 200,
      curve: Curve.EaseInOut,
      iterations: 1,
      onFinish: () => {
        this.isAnimating = false;
      }
    }, () => {
      this.rotateAngle = 360;
    });
  }

  // 执行缩放动画
  startScaleAnimation() {
    this.currentAnimation = '缩放';
    this.isAnimating = true;
    animateTo({
      duration: 200,
      curve: Curve.EaseInOut,
      iterations: 1,
      onFinish: () => {
        this.isAnimating = false;
      }
    }, () => {
      this.scaleValue = 0.8;
    });
  }

  // 执行尺寸变化动画
  startSizeChangeAnimation() {
    this.currentAnimation = '尺寸变化';
    this.isAnimating = true;
    animateTo({
      duration: 200,
      curve: Curve.EaseInOut,
      iterations: 1,
      onFinish: () => {
        this.isAnimating = false;
      }
    }, () => {
      this.componentWidth = '70%';
      this.componentHeight = 180;
    });
  }

  // 重置所有状态
  resetAll() {
    animateTo({
      duration: 1000,
      curve: Curve.EaseInOut
    }, () => {
      this.offsetX = 0;
      this.offsetY = 0;
      this.rotateAngle = 0;
      this.scaleValue = 1;
      this.componentWidth = '90%';
      this.componentHeight = 150;
    });
  }

  @Builder
  placeholderBuilder2() {
    Row({ space: 2 }) {
      Image($r('sys.media.ohos_ic_public_clock')).width(24).height(24)
      Text('Builder2').fontSize(10).fontColor(Color.White)
    }.width('13.89%').height('3.28%').padding(5).backgroundColor('#2196F3').borderRadius(4)
  }

  @Builder
  placeholderBuilder3() {
    Column() {
      Text('Builder3')
        .fontSize(14)
        .fontColor(Color.White)
        .padding(8)
    }
    .width('16.67%')
    .height('3.28%')
    .backgroundColor('#4CAF50')
    .borderRadius(8)
  }


  build() {
    Scroll() {
      Column() {
        // 标题区域
        Column() {
          Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handle-animation_0008')
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

          Text('组件: RichEditor (图文混排+Builder)')
            .fontSize(7)
            .fontColor('#66182431')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)

          Text('测试内容: 选中内容后执行动画，观察手柄和菜单')
            .fontSize(7)
            .fontColor('#66182431')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)

          Text('功能: 平移、旋转、缩放、尺寸变化、添加Builder')
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
          Text('RichEditor 组件（图文混排+Builder）')
            .fontSize(9)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')

          // RichEditor组件
          RichEditor(this.options)
            .id('UiComponentTextRichEditorHandleAnimation05')
            .onReady(() => {
              // 添加文本内容
              this.controller.addTextSpan('这是一段测试文本，', {
                style: {
                  fontColor: Color.Black,
                  fontSize: 16
                }
              });

              this.controller.addBuilderSpan(() => {
                this.placeholderBuilder3()
              });

              this.controller.addImageSpan($r('sys.media.ohos_ic_public_clock'), {
                imageStyle: {
                  size: ['30vp', '30vp'],
                  verticalAlign: ImageSpanAlignment.CENTER
                }
              });

              this.controller.addTextSpan(' 包含图片和文字混排。', {
                style: {
                  fontColor: Color.Black,
                  fontSize: 16
                }
              });

              this.controller.addTextSpan('\n', {
                style: {
                  fontColor: Color.Black,
                  fontSize: 16
                }
              });

              this.controller.addTextSpan('请长按选中一段内容，', {
                style: {
                  fontColor: Color.Blue,
                  fontSize: 16,
                  fontWeight: FontWeight.Bold
                }
              });

              this.controller.addTextSpan('然后点击下方按钮执行动画。', {
                style: {
                  fontColor: Color.Red,
                  fontSize: 16,
                  fontWeight: FontWeight.Medium
                }
              });

              // 添加换行和Builder示例
              this.controller.addTextSpan('\n\nBuilder示例: ', {
                style: {
                  fontColor: Color.Black,
                  fontSize: 14
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
            .translate({ x: this.offsetX, y: this.offsetY })
            .rotate({ angle: this.rotateAngle })
            .scale({ x: this.scaleValue, y: this.scaleValue })
            .copyOptions(CopyOptions.InApp)

          Text('长按文本选中内容，观察手柄和菜单')
            .fontSize(7)
            .fontColor('#666666')
            .textAlign(TextAlign.Center)
        }
        .width('100%')
        .padding({ top: 8, bottom: 8 })
        .alignItems(HorizontalAlign.Center)

        // 控制按钮区域
        Column({ space: 8 }) {
          Row({ space: 10 }) {
            Button('平移动画')
              .fontSize(8)
              .width(80)
              .id('UiComponentTextRichEditorHandleAnimation05_01')
              .height(36)
              .backgroundColor('#007DFF')
              .enabled(!this.isAnimating)
              .onClick(() => {
                this.startTranslateAnimation();
              })

            Button('旋转动画')
              .fontSize(8)
              .width(80)
              .id('UiComponentTextRichEditorHandleAnimation05_02')
              .height(36)
              .backgroundColor('#2196F3')
              .enabled(!this.isAnimating)
              .onClick(() => {
                this.startRotateAnimation();
              })
          }
          .justifyContent(FlexAlign.Center)

          Row({ space: 10 }) {
            Button('缩放动画')
              .fontSize(8)
              .width(80)
              .id('UiComponentTextRichEditorHandleAnimation05_03')
              .height(36)
              .backgroundColor('#4CAF50')
              .enabled(!this.isAnimating)
              .onClick(() => {
                this.startScaleAnimation();
              })

            Button('尺寸变化')
              .fontSize(8)
              .width(80)
              .id('UiComponentTextRichEditorHandleAnimation05_04')
              .height(36)
              .backgroundColor('#FF9800')
              .enabled(!this.isAnimating)
              .onClick(() => {
                this.startSizeChangeAnimation();
              })
          }
          .justifyContent(FlexAlign.Center)

          Row({ space: 10 }) {
            Button('添加Builder')
              .fontSize(8)
              .width(80)
              .id('UiComponentTextRichEditorHandleAnimation05_05')
              .height(36)
              .backgroundColor('#9C27B0')
              .onClick(() => {
                this.controller.addBuilderSpan(this.my_builder, { offset: this.my_offset });
              })

            Button('切换Builder')
              .fontSize(8)
              .width(80)
              .id('UiComponentTextRichEditorHandleAnimation05_06')
              .height(36)
              .backgroundColor('#673AB7')
              .onClick(() => {
                // 切换到下一个Builder
                if (this.my_builder == undefined) {
                  this.my_builder = () => {
                    this.placeholderBuilder2()
                  };
                } else {
                  this.my_builder = () => {
                    this.my_builder2()
                  };
                }
              })
          }
          .justifyContent(FlexAlign.Center)

          Button('重置所有')
            .fontSize(8)
            .width(170)
            .height(36)
            .backgroundColor('#F44336')
            .enabled(!this.isAnimating && (this.offsetX !== 0 || this.rotateAngle !== 0 || this.scaleValue !== 1 || this.componentWidth !== '90%'))
            .onClick(() => {
              this.resetAll();
            })
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

          Text('✓ 手柄跟随组件一起做动画')
            .fontSize(7)
            .fontColor('#388E3C')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)

          Text('✓ 菜单在动画过程中隐藏')
            .fontSize(7)
            .fontColor('#388E3C')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)

          Text('✓ 图文混排+Builder内容可正常选中')
            .fontSize(7)
            .fontColor('#388E3C')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)

          Text('✓ 支持平移、旋转、缩放、尺寸变化动画')
            .fontSize(7)
            .fontColor('#388E3C')
            .lineHeight(11)
            .alignSelf(ItemAlign.Start)

          Text('✓ 支持动态添加和切换Builder组件')
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

          Text('步骤2: 观察选中后显示的手柄和菜单')
            .fontSize(7)
            .fontColor('#666666')
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤3: 点击"平移动画"按钮，观察手柄和菜单')
            .fontSize(7)
            .fontColor('#666666')
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤4: 点击"添加Builder"按钮添加Builder组件')
            .fontSize(7)
            .fontColor('#666666')
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤5: 点击"切换Builder"更换不同Builder样式')
            .fontSize(7)
            .fontColor('#666666')
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤6: 选中Builder内容，点击"旋转动画"')
            .fontSize(7)
            .fontColor('#2E7D32')
            .fontWeight(FontWeight.Medium)
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤7: 重复测试"缩放动画"和"尺寸变化"')
            .fontSize(7)
            .fontColor('#666666')
            .lineHeight(10)
            .alignSelf(ItemAlign.Start)

          Text('步骤8: 验证所有动画下手柄都跟随组件变化')
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

          Text('• 内容包含：文本、图标、Builder组件')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• Builder1: 橙色背景，Builder2: 蓝色背景，Builder3: 绿色背景')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 4种动画：平移、旋转、缩放、尺寸变化')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 所有动画时长200ms，曲线EaseInOut')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 支持动态添加和切换Builder组件')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 可通过"重置所有"按钮恢复初始状态')
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

