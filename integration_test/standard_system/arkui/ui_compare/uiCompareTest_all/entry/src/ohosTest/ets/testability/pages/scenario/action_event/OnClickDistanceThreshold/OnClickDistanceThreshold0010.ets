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
struct OnClickDistanceThreshold0010 {
  @State clickCount: number = 0;
  @State testStatus: string = '等待测试';
  @State testResult: string = '';
  @State touchStartX: number = 0;
  @State touchStartY: number = 0;
  @State touchEndX: number = 0;
  @State touchEndY: number = 0;
  @State moveDistance: number = 0;
  private distanceThreshold: number = 200.5; // vp

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

            Text('本测试用例验证distanceThreshold为200.5vp时，移动距离大于200.5vp不触发点击事件')
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

              Text('1. 打开demo，设置distanceThreshold为200.5vp')
                .fontSize(12)
                .fontColor('#666666')
                .alignSelf(ItemAlign.Start)
                .margin({ left: 10, bottom: 3 })

              Text('2. 手指落下抬起，移动距离大于200.5vp')
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
                .fontWeight(FontWeight.Bold)
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
          .backgroundColor('#F5F5F5')
          .borderRadius(10)
          .margin({ top: 20 })

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
              Text(`${this.distanceThreshold} vp`)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#2196F3')
            }
            .width('100%')
            .margin({ bottom: 5 })

            Row() {
              Text('要求移动距离: ')
                .fontSize(14)
                .fontColor('#666666')
              Text('> 200.5 vp')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FF5722')
            }
            .width('100%')
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .border({ width: 1, color: '#E0E0E0' })

          // 测试状态
          Column() {
            Text('测试状态')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 10 })
              .alignSelf(ItemAlign.Start)

            Row() {
              Text('当前状态: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(this.testStatus)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor('#2196F3')
                .layoutWeight(1)
            }
            .width('100%')
            .margin({ bottom: 10 })

            Row() {
              Text('点击次数: ')
                .fontSize(14)
                .fontColor('#666666')
              Text(`${this.clickCount}`)
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(this.clickCount > 0 ? '#F44336' : '#4CAF50')
            }
            .width('100%')
            .margin({ bottom: 10 })

            if (this.moveDistance > 0) {
              Divider()
                .margin({ top: 5, bottom: 10 })

              Row() {
                Text('移动距离: ')
                  .fontSize(14)
                  .fontColor('#666666')
                Text(`${this.moveDistance.toFixed(2)} vp`)
                  .fontSize(14)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(this.moveDistance > this.distanceThreshold ? '#4CAF50' : '#FF9800')
              }
              .width('100%')
              .margin({ bottom: 5 })

              Row() {
                Text('起始位置: ')
                  .fontSize(12)
                  .fontColor('#999999')
                Text(`(${this.touchStartX.toFixed(0)}, ${this.touchStartY.toFixed(0)})`)
                  .fontSize(12)
                  .fontColor('#666666')
              }
              .width('100%')
              .margin({ bottom: 5 })

              Row() {
                Text('结束位置: ')
                  .fontSize(12)
                  .fontColor('#999999')
                Text(`(${this.touchEndX.toFixed(0)}, ${this.touchEndY.toFixed(0)})`)
                  .fontSize(12)
                  .fontColor('#666666')
              }
              .width('100%')
            }

            if (this.testResult) {
              Divider()
                .margin({ top: 10, bottom: 10 })

              Text(this.testResult)
                .fontSize(13)
                .fontColor(this.clickCount > 0 ? '#F44336' : '#4CAF50')
                .fontWeight(FontWeight.Medium)
            }
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .border({ width: 1, color: '#E0E0E0' })

          // 测试区域
          Column() {
            Text('测试区域')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)

            Text('请在下方蓝色区域内进行测试操作')
              .fontSize(12)
              .fontColor('#666666')
              .margin({ bottom: 10 })

            // 可点击的测试按钮
            Column() {
              Text('测试按钮')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FFFFFF')
                .margin({ bottom: 10 })

              Text('请按住并拖动超过200.5vp')
                .fontSize(14)
                .fontColor('#E3F2FD')
                .margin({ bottom: 5 })

              Text(`当前点击次数: ${this.clickCount}`)
                .fontSize(14)
                .fontColor(this.clickCount > 0 ? '#FFCDD2' : '#C8E6C9')
                .fontWeight(FontWeight.Medium)
            }
            .id('test_button')
            .width('80%')
            .height('16.39%')
            .backgroundColor('#2196F3')
            .borderRadius(12)
            .justifyContent(FlexAlign.Center)
            .onClick(() => {
              this.clickCount++;
              this.testStatus = '❌ 触发了点击事件（不符合预期）';
              this.testResult = `❌ 测试失败：移动距离${this.moveDistance.toFixed(2)}vp > ${this.distanceThreshold}vp，但仍触发了点击事件`;
              console.error(`[OnClickDistanceThreshold0010] 点击事件被触发，点击次数: ${this.clickCount}`);
            }, this.distanceThreshold)
            .onTouch((event: TouchEvent) => {
              if (event.type === TouchType.Down) {
                this.touchStartX = event.touches[0].x;
                this.touchStartY = event.touches[0].y;
                this.testStatus = '手指按下';
                console.info(`[OnClickDistanceThreshold0010] Touch Down: (${this.touchStartX}, ${this.touchStartY})`);
              } else if (event.type === TouchType.Up) {
                this.touchEndX = event.touches[0].x;
                this.touchEndY = event.touches[0].y;
                this.moveDistance = this.calculateDistance(
                  this.touchStartX,
                  this.touchStartY,
                  this.touchEndX,
                  this.touchEndY
                );
                
                this.testStatus = '手指抬起';
                console.info(`[OnClickDistanceThreshold0010] Touch Up: (${this.touchEndX}, ${this.touchEndY}), 移动距离: ${this.moveDistance}vp`);
                
                // 延迟检查结果，等待可能的点击事件
                setTimeout(() => {
                  if (this.moveDistance > this.distanceThreshold) {
                    if (this.clickCount === 0) {
                      this.testStatus = '✓ 测试通过';
                      this.testResult = `✓ 测试成功：移动距离${this.moveDistance.toFixed(2)}vp > ${this.distanceThreshold}vp，未触发点击事件`;
                      console.info(`[OnClickDistanceThreshold0010] 测试通过：移动距离${this.moveDistance}vp，未触发点击`);
                    }
                  } else {
                    this.testStatus = '⚠️ 移动距离不足';
                    this.testResult = `⚠️ 移动距离${this.moveDistance.toFixed(2)}vp ≤ ${this.distanceThreshold}vp，请重新测试并移动更远距离`;
                  }
                }, 100);
              }
            })

            Text('提示：按住按钮并拖动，确保移动距离超过200.5vp')
              .fontSize(11)
              .fontColor('#FF9800')
              .margin({ top: 15 })
              .textAlign(TextAlign.Center)
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .border({ width: 1, color: '#E0E0E0' })

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
                Text('保持按住状态，向任意方向拖动')
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
                Text('确保移动距离超过200.5vp后抬起手指')
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
                Text('观察点击次数是否保持为0')
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
              this.testStatus = '等待测试';
              this.testResult = '';
              this.touchStartX = 0;
              this.touchStartY = 0;
              this.touchEndX = 0;
              this.touchEndY = 0;
              this.moveDistance = 0;
              console.info('[OnClickDistanceThreshold0010] 测试已重置');
            })
            .margin({ bottom: 30 })
        }
        .width('100%')
        .padding({ left: 16, right: 16 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
