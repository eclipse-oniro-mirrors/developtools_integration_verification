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
struct OnClickDistanceThreshold0190 {
  @State clickCount: number = 0;
  @State testStatus: string = '等待测试';
  @State testResult: string = '';
  @State touchStartX: number = 0;
  @State touchStartY: number = 0;
  @State touchEndX: number = 0;
  @State touchEndY: number = 0;
  @State moveDistance: number = 0;
  @State isStartOutside: boolean = false; // 标记是否从外部开始
  @State buttonTop: number = 0; // 按钮的顶部位置 (全局)
  @State buttonBottom: number = 0; // 按钮的底部位置 (全局)
  @State buttonLeft: number = 0; // 按钮的左侧位置 (全局)
  @State buttonRight: number = 0; // 按钮的右侧位置 (全局)
  private distanceThreshold: number = 100; // 设置为100vp，小于组件区域

  // 计算移动距离
  calculateDistance(startX: number, startY: number, endX: number, endY: number): number {
    const dx = endX - startX;
    const dy = endY - startY;
    return Math.sqrt(dx * dx + dy * dy);
  }

  // 判断点是否在按钮内
  isPointInsideButton(x: number, y: number): boolean {
    return x >= this.buttonLeft && x <= this.buttonRight &&
           y >= this.buttonTop && y <= this.buttonBottom;
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('distanceThreshold 测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
      .width('100%')
      .height('4.59%')
      .backgroundColor('#2196F3')
      .justifyContent(FlexAlign.Center)

      Scroll() {
        Column({ space: 20 }) {
          // 测试说明
          Column() {
            Text('测试说明')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Text('本测试用例验证distanceThreshold阈值小于组件区域时，手指从组件外滑入组件内，移动距离在distanceThreshold阈值外')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 10 })

            Column() {
              Text('测试步骤:')
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 5 })

              Text('1. 打开demo，设置distanceThreshold为100vp（小于组件区域）')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('2. 手指从组件外滑入组件内，移动距离在distanceThreshold阈值外')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#FFF3E0')
            .borderRadius(8)
            .margin({ bottom: 10 })

            Column() {
              Text('预期结果:')
                .fontSize(13)
                .fontWeight(FontWeight.Medium)
                .fontColor('#333333')
                .alignSelf(ItemAlign.Start)
                .margin({ bottom: 5 })

              Text('✓ 不触发点击事件')
                .fontSize(12)
                .fontColor('#4CAF50')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E8F5E9')
            .borderRadius(8)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(12)
          .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })

          // 配置信息
          Column() {
            Text('配置信息')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Row() {
              Text('distanceThreshold: ')
                .fontSize(14)
                .fontColor('#666666')
              Text('100 vp')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#2196F3')
            }
            .width('100%')

            Row() {
              Text('测试操作: ')
                .fontSize(14)
                .fontColor('#666666')
              Text('从外滑入，距离 > 100vp')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FF5722')
            }
            .width('100%')

            Row() {
              Text('特殊说明: ')
                .fontSize(14)
                .fontColor('#666666')
              Text('从灰色区域滑入蓝色区域，移动距离超过阈值')
                .fontSize(12)
                .fontColor('#FF9800')
                .layoutWeight(1)
            }
            .width('100%')
            .margin({ top: 10 })
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(12)
          .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })

          // 实时状态
          Column() {
            Text('实时状态')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Row() {
              Text('点击次数: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(`${this.clickCount}`)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(this.clickCount > 0 ? '#F44336' : '#4CAF50')
            }
            .width('100%')
            .margin({ bottom: 8 })

            Row() {
              Text('移动距离: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(`${this.moveDistance.toFixed(2)} vp`)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#2196F3')
            }
            .width('100%')
            .margin({ bottom: 8 })

            Row() {
              Text('距离阈值: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(`${this.distanceThreshold} vp`)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#9C27B0')
            }
            .width('100%')
            .margin({ bottom: 8 })

            Row() {
              Text('测试状态: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.testStatus)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(
                  this.testStatus.includes('✓') ? '#4CAF50' :
                  this.testStatus.includes('❌') ? '#F44336' :
                  this.testStatus.includes('⚠') ? '#FF9800' : '#666666'
                )
            }
            .width('100%')
            .margin({ bottom: 8 })

            if (this.testResult) {
              Text(this.testResult)
                .fontSize(12)
                .fontColor(
                  this.testResult.includes('✓') ? '#4CAF50' :
                  this.testResult.includes('❌') ? '#F44336' : '#FF9800'
                )
                .width('100%')
                .margin({ top: 10 })
            }
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(12)
          .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })

          // 测试按钮区域
          Column() {
            Text('操作区域')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Text('蓝色区域 = 组件内区域')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 5 })

            Text('灰色区域 = 组件外区域')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 15 })

            // 外部容器（用于监听从外部开始的触摸）
            Column() {
              Column() {
                Text('测试按钮')
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#FFFFFF')
                  .margin({ bottom: 10 })

                Text('请从灰色区域滑入蓝色区域（>100vp）')
                  .fontSize(14)
                  .fontColor('#E3F2FD')
                  .margin({ bottom: 5 })

                Text(`当前点击次数: ${this.clickCount}`)
                  .fontSize(14)
                  .fontColor(this.clickCount > 0 ? '#FFCDD2' : '#C8E6C9')
                  .fontWeight(FontWeight.Medium)

                Text(this.isStartOutside ? '✓ 起点在外部' : '⚠ 起点在内部')
                  .fontSize(12)
                  .fontColor(this.isStartOutside ? '#C8E6C9' : '#FFCDD2')
                  .margin({ top: 5 })
              }
              .id('test_button')
              .width('60%')
              .height('14.75%')
              .backgroundColor('#2196F3')
              .borderRadius(12)
              .justifyContent(FlexAlign.Center)
              .onTouch((event: TouchEvent) => {
                const globalX = event.touches[0].displayX;
                const globalY = event.touches[0].displayY;
                if (event.type === TouchType.Move && this.isStartOutside) {
                  const isNowInside = this.isPointInsideButton(globalX, globalY);
                  if (isNowInside) {
                    this.testStatus = `✓ 已滑入组件内(${globalX.toFixed(0)}, ${globalY.toFixed(0)})，请抬起...`;
                    console.info(`[OnClickDistanceThreshold0190] Button TouchMove: Moved into button at (${globalX}, ${globalY})`);
                  } else {
                    this.testStatus = `✓ 在组件外移动(${globalX.toFixed(0)}, ${globalY.toFixed(0)})，请继续向内滑动...`;
                    console.info(`[OnClickDistanceThreshold0190] Button TouchMove: Still outside at (${globalX}, ${globalY})`);
                  }
                } else if (event.type === TouchType.Up) {
                  this.touchEndX = globalX;
                  this.touchEndY = globalY;
                  this.moveDistance = this.calculateDistance(
                    this.touchStartX,
                    this.touchStartY,
                    this.touchEndX,
                    this.touchEndY
                  );

                  const isEndInside = this.isPointInsideButton(globalX, globalY);

                  console.info(`[OnClickDistanceThreshold0190] Button TouchUp at (${globalX}, ${globalY}), 移动距离: ${this.moveDistance.toFixed(2)}vp, 起点在外: ${this.isStartOutside}, 终点在内: ${isEndInside}`);

                  if (!this.isStartOutside) {
                    this.testStatus = '⚠️ 测试无效：起点必须在组件外';
                    this.testResult = `⚠️ 请重新测试：确保从灰色区域（组件外）开始滑动。起点坐标:(${this.touchStartX.toFixed(0)}, ${this.touchStartY.toFixed(0)})`;
                  } else if (!isEndInside) {
                    this.testStatus = '⚠️ 测试无效：终点必须在组件内';
                    this.testResult = `⚠️ 请重新测试：确保在蓝色区域（组件内）抬起。终点坐标:(${this.touchEndX.toFixed(0)}, ${this.touchEndY.toFixed(0)})`;
                  } else if (this.moveDistance <= this.distanceThreshold) {
                    this.testStatus = '⚠️ 移动距离未超出阈值';
                    this.testResult = `⚠️ 移动距离${this.moveDistance.toFixed(2)}vp ≤ ${this.distanceThreshold}vp，请重新测试并保持移动距离超过阈值`;
                  } else {
                    // 有效的测试 - 显示检测中
                    this.testStatus = '⏳ 检测中，等待点击事件判断...';
                    this.testResult = `⏳ 移动距离${this.moveDistance.toFixed(2)}vp，等待点击事件结果...`;

                    // 延迟检查结果，等待可能的点击事件
                    setTimeout(() => {
                      if (this.clickCount === 0) {
                        this.testStatus = '✓✓✓ 测试通过！';
                        this.testResult = `✓ 测试成功：从组件外滑入组件内（距离${this.moveDistance.toFixed(2)}vp > ${this.distanceThreshold}vp），未触发点击事件`;
                        console.info(`[OnClickDistanceThreshold0190] 测试通过：从组件外滑入，移动距离超过阈值，未触发点击`);
                      } else {
                        this.testStatus = '❌ 测试失败';
                        this.testResult = `❌ 测试失败：从组件外滑入组件内时不应触发点击事件，但触发了${this.clickCount}次`;
                        console.error(`[OnClickDistanceThreshold0190] 测试失败：触发了点击`);
                      }
                    }, 150);
                  }
                }
              })
              .onClick(() => {
                this.clickCount++;
                this.testStatus = '❌ 触发了点击事件（不符合预期）';
                this.testResult = `❌ 测试失败：从组件外滑入组件内时不应触发点击事件`;
                console.error(`[OnClickDistanceThreshold0190] 点击事件被触发，点击次数: ${this.clickCount}`);
              }, this.distanceThreshold)
              .onAreaChange((oldArea: Area, newArea: Area) => {
                this.buttonLeft = newArea.globalPosition.x as number;
                this.buttonTop = newArea.globalPosition.y as number;
                this.buttonRight = this.buttonLeft + (newArea.width as number);
                this.buttonBottom = this.buttonTop + (newArea.height as number);
                console.info(`[OnClickDistanceThreshold0190] Button global area: (${this.buttonLeft.toFixed(0)}, ${this.buttonTop.toFixed(0)}) to (${this.buttonRight.toFixed(0)}, ${this.buttonBottom.toFixed(0)})`);
              })
            }
            .width('90%')
            .height('24.59%')
            .backgroundColor('#E0E0E0')
            .borderRadius(12)
            .justifyContent(FlexAlign.Center)
            .onTouch((event: TouchEvent) => {
              const globalX = event.touches[0].displayX;
              const globalY = event.touches[0].displayY;

              if (event.type === TouchType.Down) {
                this.touchStartX = globalX;
                this.touchStartY = globalY;
                this.isStartOutside = !this.isPointInsideButton(globalX, globalY);

                if (this.isStartOutside) {
                  this.testStatus = `✓ 按下在组件外(${globalX.toFixed(0)}, ${globalY.toFixed(0)})，请向内滑动...`;
                  console.info(`[OnClickDistanceThreshold0190] Outer TouchDown OUTSIDE button at (${globalX}, ${globalY})`);
                } else {
                  this.testStatus = `⚠ 按下在组件内(${globalX.toFixed(0)}, ${globalY.toFixed(0)})，请重新从外部开始`;
                  console.warn(`[OnClickDistanceThreshold0190] Outer TouchDown INSIDE button at (${globalX}, ${globalY})`);
                }
              } else if (event.type === TouchType.Move) {
                const isNowInside = this.isPointInsideButton(globalX, globalY);
                if (this.isStartOutside && isNowInside) {
                  this.testStatus = `✓ 已滑入组件内(${globalX.toFixed(0)}, ${globalY.toFixed(0)})，请抬起...`;
                  console.info(`[OnClickDistanceThreshold0190] Outer TouchMove: Moved into button at (${globalX}, ${globalY})`);
                } else if (this.isStartOutside && !isNowInside) {
                  this.testStatus = `✓ 在组件外移动(${globalX.toFixed(0)}, ${globalY.toFixed(0)})，请继续向内滑动...`;
                  console.info(`[OnClickDistanceThreshold0190] Outer TouchMove: Still outside at (${globalX}, ${globalY})`);
                }
              } else if (event.type === TouchType.Up) {
                this.touchEndX = globalX;
                this.touchEndY = globalY;
                this.moveDistance = this.calculateDistance(
                  this.touchStartX,
                  this.touchStartY,
                  this.touchEndX,
                  this.touchEndY
                );

                const isEndInside = this.isPointInsideButton(globalX, globalY);

                console.info(`[OnClickDistanceThreshold0190] Outer TouchUp at (${globalX}, ${globalY}), 移动距离: ${this.moveDistance.toFixed(2)}vp, 起点在外: ${this.isStartOutside}, 终点在内: ${isEndInside}`);

                if (!this.isStartOutside) {
                  this.testStatus = '⚠️ 测试无效：起点必须在组件外';
                  this.testResult = `⚠️ 请重新测试：确保从灰色区域（组件外）开始滑动。起点坐标:(${this.touchStartX.toFixed(0)}, ${this.touchStartY.toFixed(0)})`;
                } else if (isEndInside) {
                  // 终点在内部，但事件被按钮拦截了，这里不会执行
                  this.testStatus = '⚠ 终点在组件内，但事件可能被按钮拦截';
                  this.testResult = `⚠ 请检查按钮的onTouchUp是否正确处理。`;
                } else if (this.moveDistance <= this.distanceThreshold) {
                  this.testStatus = '⚠️ 移动距离未超出阈值';
                  this.testResult = `⚠️ 移动距离${this.moveDistance.toFixed(2)}vp ≤ ${this.distanceThreshold}vp，请重新测试并保持移动距离超过阈值`;
                } else {
                  // 有效的测试，且终点在外部
                  this.testStatus = '⚠ 测试无效：终点必须在组件内';
                  this.testResult = `⚠️ 请重新测试：确保在蓝色区域（组件内）抬起。终点坐标:(${this.touchEndX.toFixed(0)}, ${this.touchEndY.toFixed(0)})`;
                }
              }
            })
          }

          // 操作说明
          Column() {
            Text('操作说明')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            Column() {
              Row() {
                Text('1.')
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .margin({ right: 8 })
                Text('在灰色区域（组件外）按下手指')
                  .fontSize(14)
                  .fontColor('#333333')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 8 })

              Row() {
                Text('2.')
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .margin({ right: 8 })
                Text('保持按住状态，向蓝色区域（组件内）滑动（移动距离 > 100vp）')
                  .fontSize(14)
                  .fontColor('#333333')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 8 })

              Row() {
                Text('3.')
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .margin({ right: 8 })
                Text('在蓝色区域（组件内）抬起手指')
                  .fontSize(14)
                  .fontColor('#333333')
                  .layoutWeight(1)
              }
              .width('100%')

              Row() {
                Text('⚠️')
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .margin({ right: 8 })
                Text('关键：从外滑入，移动距离必须超过100vp，不触发点击')
                  .fontSize(13)
                  .fontColor('#FF5722')
                  .fontWeight(FontWeight.Medium)
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ top: 10 })
            }
            .width('100%')
            .padding(10)
            .backgroundColor('#E3F2FD')
            .borderRadius(8)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(10)
          .margin({ bottom: 30 })

          // 重置按钮
          Button('重置测试')
            .fontSize(16)
            .backgroundColor('#FF9800')
            .fontColor('#FFFFFF')
            .width('90%')
            .height(48)
            .onClick(() => {
              this.clickCount = 0;
              this.testStatus = '等待测试';
              this.testResult = '';
              this.moveDistance = 0;
              this.touchStartX = 0;
              this.touchStartY = 0;
              this.touchEndX = 0;
              this.touchEndY = 0;
              this.isStartOutside = false;
              console.info('[OnClickDistanceThreshold0190] 测试已重置');
            })

          Column() {
            Text('💡 测试提示')
              .fontSize(13)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF9800')
              .margin({ bottom: 8 })

            Text('• 在灰色区域（组件外）按下手指')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• 向蓝色区域滑动，距离 > 100vp')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• 在蓝色区域（组件内）抬起手指')
              .fontSize(11)
              .fontColor('#666666')
              .alignSelf(ItemAlign.Start)
              .margin({ bottom: 3 })

            Text('• 预期：不触发点击事件（点击次数保持为0）')
              .fontSize(11)
              .fontColor('#4CAF50')
              .fontWeight(FontWeight.Medium)
              .alignSelf(ItemAlign.Start)
          }
          .width('90%')
          .padding(12)
          .backgroundColor('#FFF8E1')
          .borderRadius(8)
          .margin({ top: 15 })

          Text('提示：从组件外滑入组件内，移动距离超过100vp时不会触发点击事件')
            .fontSize(11)
            .fontColor('#FF9800')
            .margin({ top: 15 })
            .textAlign(TextAlign.Center)
        }
        .width('100%')
        .padding({ top: 20, bottom: 20 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
