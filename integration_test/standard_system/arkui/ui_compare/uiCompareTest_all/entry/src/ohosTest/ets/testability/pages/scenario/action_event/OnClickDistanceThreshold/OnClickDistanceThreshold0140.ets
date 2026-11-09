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
struct OnClickDistanceThreshold0140 {
  @State clickCount: number = 0;
  @State testStatus: string = '等待测试';
  @State testResult: string = '';
  @State touchStartX: number = 0;
  @State touchStartY: number = 0;
  @State touchEndX: number = 0;
  @State touchEndY: number = 0;
  @State moveDistance: number = 0;
  @State testRound: number = 0; // 当前测试轮次
  private distanceThreshold: number = 100; // 设置为100vp，小于组件区域（按钮宽度约288vp，高度200vp）
  private totalRounds: number = 10; // 总共需要测试10次

  // 计算移动距离
  calculateDistance(startX: number, startY: number, endX: number, endY: number): number {
    const dx = endX - startX;
    const dy = endY - startY;
    return Math.sqrt(dx * dx + dy * dy);
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

            Text('本测试用例验证distanceThreshold阈值小于组件区域时，手指在组件内移动，移动距离在阈值内触发点击事件，重复测试10次')
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

              Text('2. 手指在组件内移动，移动距离在100vp阈值内')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('3. 重复步骤1十次')
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

              Text('✓ 每次都触发点击事件')
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
              Text('测试轮次: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(`${this.testRound} / ${this.totalRounds}`)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#9C27B0')
            }
            .width('100%')

            Row() {
              Text('测试操作: ')
                .fontSize(14)
                .fontColor('#666666')
              Text('在组件内移动，距离 ≤ 100vp，重复10次')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FF5722')
            }
            .width('100%')

            Row() {
              Text('特殊说明: ')
                .fontSize(14)
                .fontColor('#666666')
              Text('每次移动距离在阈值内时都应触发点击')
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
                .fontColor(this.clickCount > 0 ? '#4CAF50' : '#F44336')
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

          // 测试按钮
          Column() {
            Column() {
              Text('测试按钮')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FFFFFF')
                .margin({ bottom: 10 })

              Text(`请在组件内移动（≤100vp）- 第${this.testRound + 1}次`)
                .fontSize(14)
                .fontColor('#E3F2FD')
                .margin({ bottom: 5 })

              Text(`当前点击次数: ${this.clickCount}`)
                .fontSize(14)
                .fontColor(this.clickCount > 0 ? '#C8E6C9' : '#FFCDD2')
                .fontWeight(FontWeight.Medium)
            }
            .id('test_button')
            .width('80%')
            .height('16.39%')
            .backgroundColor(this.testRound >= this.totalRounds ? '#9E9E9E' : '#2196F3')
            .borderRadius(12)
            .justifyContent(FlexAlign.Center)
            .onClick(() => {
              if (this.testRound < this.totalRounds) {
                this.clickCount++;
                this.testStatus = `✓ 第${this.testRound + 1}次触发了点击事件`;
                this.testResult = `✓ 第${this.testRound + 1}次测试：移动距离${this.moveDistance.toFixed(2)}vp ≤ ${this.distanceThreshold}vp，触发了点击事件`;
                console.info(`[OnClickDistanceThreshold0140] 第${this.testRound + 1}次点击事件被触发，总点击次数: ${this.clickCount}`);
              }
            }, this.distanceThreshold)
            .onTouch((event: TouchEvent) => {
              if (event.type === TouchType.Down) {
                this.touchStartX = event.touches[0].x;
                this.touchStartY = event.touches[0].y;
                this.testStatus = '按下中...';
                console.info(`[OnClickDistanceThreshold0140] TouchDown at (${this.touchStartX}, ${this.touchStartY})`);
              } else if (event.type === TouchType.Up) {
                if (this.testRound < this.totalRounds) {
                  this.touchEndX = event.touches[0].x;
                  this.touchEndY = event.touches[0].y;
                  this.moveDistance = this.calculateDistance(
                    this.touchStartX,
                    this.touchStartY,
                    this.touchEndX,
                    this.touchEndY
                  );
                  this.testStatus = '抬起，计算中...';
                  console.info(`[OnClickDistanceThreshold0140] TouchUp at (${this.touchEndX}, ${this.touchEndY}), 移动距离: ${this.moveDistance}vp`);

                  // 延迟检查结果，等待可能的点击事件
                  setTimeout(() => {
                    if (this.moveDistance <= this.distanceThreshold) {
                      if (this.clickCount > this.testRound) {
                        this.testRound++;
                        this.testStatus = `✓ 第${this.testRound}次测试通过`;
                        this.testResult = `✓ 第${this.testRound}次测试成功：移动距离${this.moveDistance.toFixed(2)}vp ≤ ${this.distanceThreshold}vp，触发了点击事件`;
                        console.info(`[OnClickDistanceThreshold0140] 第${this.testRound}次测试通过`);
                        
                        if (this.testRound >= this.totalRounds) {
                          this.testStatus = '✓✓✓ 全部10次测试通过！';
                          this.testResult = `✓✓✓ 测试完成：共进行${this.totalRounds}次测试，全部成功触发点击事件！`;
                        }
                      } else {
                        this.testStatus = `❌ 第${this.testRound + 1}次未触发点击事件`;
                        this.testResult = `❌ 第${this.testRound + 1}次测试失败：移动距离${this.moveDistance.toFixed(2)}vp ≤ ${this.distanceThreshold}vp，应该触发点击事件但未触发`;
                        console.error(`[OnClickDistanceThreshold0140] 第${this.testRound + 1}次测试失败`);
                      }
                    } else {
                      this.testStatus = '⚠️ 移动距离超出阈值';
                      this.testResult = `⚠️ 移动距离${this.moveDistance.toFixed(2)}vp > ${this.distanceThreshold}vp，请重新测试并保持移动距离在阈值内`;
                    }
                  }, 100);
                }
              }
            })
          }
          .width('100%')
          .padding({ top: 20, bottom: 20 })

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
                Text('按住测试按钮')
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
                Text('保持按住状态，在组件内移动（移动距离 ≤ 100vp）')
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
                Text('在组件内抬起手指')
                  .fontSize(14)
                  .fontColor('#333333')
                  .layoutWeight(1)
              }
              .width('100%')
              .margin({ bottom: 8 })

              Row() {
                Text('4.')
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .margin({ right: 8 })
                Text('重复步骤1-3，共测试10次')
                  .fontSize(14)
                  .fontColor('#333333')
                  .layoutWeight(1)
              }
              .width('100%')
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
              this.testRound = 0;
              this.testStatus = '等待测试';
              this.testResult = '';
              this.moveDistance = 0;
              this.touchStartX = 0;
              this.touchStartY = 0;
              this.touchEndX = 0;
              this.touchEndY = 0;
              console.info('[OnClickDistanceThreshold0140] 测试已重置');
            })

          Text('提示：distanceThreshold为100vp时，移动距离在阈值内会触发点击事件，需重复测试10次')
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
