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
struct VideoOptimize26 {
  @State statusMsg: string = '等待操作...';
  @State operationCount: number = 0;
  @State videoStatus: 'idle' | 'loading' | 'success' | 'error' | 'playing' = 'idle';
  @State currentVideoIndex: number = 0;
  @State eventHistory: string[] = [];
  @State duration: number = 0;
  @State currentTime: number = 0;
  @State isPlaying: boolean = false;
  controller: VideoController = new VideoController();

  getStatusText(): string {
    switch (this.videoStatus) {
      case 'idle': return '空闲';
      case 'loading': return '加载中';
      case 'success': return '成功';
      case 'error': return '错误';
      case 'playing': return '播放中';
      default: return '未知';
    }
  }

  addEvent(event: string) {
    this.eventHistory.push(`${new Date().toLocaleTimeString()}: ${event}`);
    if (this.eventHistory.length > 5) {
      this.eventHistory.shift();
    }
  }

  build() {
    Column() {
      // 页面标题
      Row() {
        Text('⏭️')
          .fontSize(24)
          .margin({ right: 8 })
        
        Column() {
          Text('Video组件跳转进度位置后开始播放测试')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2C3E50')
          
          Text('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0260')
            .fontSize(12)
            .fontColor('#7F8C8D')
            .margin({ top: 2 })
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ bottom: 16 })

      // 视频列表指示器
      Row() {
        ForEach([0, 1, 2], (index: number) => {
          Circle({ width: 8, height: 8 })
            .fill(this.currentVideoIndex === index ? '#3498DB' : '#BDC3C7')
            .margin({ left: 4, right: 4 });
        });
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ bottom: 12 })

      // 视频列表
      Column() {
        // 视频1
        Column() {
          Text('📹 视频 1')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#34495E')
            .margin({ bottom: 8 })

          Video({
            src: $rawfile('video1.mp4')
          })
            .width('100%')
            .height(100)
            .borderRadius(8)
            .shadow({
              radius: 4,
              color: '#1F000000',
              offsetX: 0,
              offsetY: 2
            })
        }
        .width('100%')
        .padding(8)
        .backgroundColor(Color.White)
        .borderRadius(8)
        .shadow({
          radius: 4,
          color: '#1A000000',
          offsetX: 0,
          offsetY: 2
        })
        .margin({ bottom: 8 })

        // 视频2
        Column() {
          Text('📹 视频 2')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#34495E')
            .margin({ bottom: 8 })

          Video({
            src: $rawfile('video2.mp4')
          })
            .width('100%')
            .height(100)
            .borderRadius(8)
            .shadow({
              radius: 4,
              color: '#1F000000',
              offsetX: 0,
              offsetY: 2
            })
        }
        .width('100%')
        .padding(8)
        .backgroundColor(Color.White)
        .borderRadius(8)
        .shadow({
          radius: 4,
          color: '#1A000000',
          offsetX: 0,
          offsetY: 2
        })
        .margin({ bottom: 8 })

        // 视频3 (主要测试视频)
        Column() {
          Row() {
            Text('📹 视频 3 (测试目标)')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#34495E')
            
            Circle({ width: 8, height: 8 })
              .fill(this.videoStatus === 'success' ? '#27AE60' : 
                    this.videoStatus === 'error' ? '#E74C3C' : 
                    this.videoStatus === 'loading' ? '#F39C12' : 
                    this.videoStatus === 'playing' ? '#3498DB' : '#BDC3C7')
              .margin({ left: 8 })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .margin({ bottom: 8 })

          Video({
            src: $rawfile('video3.mp4'),
            controller: this.controller
          })
            .id('video_26')
            .width('100%')
            .height(100)
            .borderRadius(8)
            .shadow({
              radius: 4,
              color: '#1F000000',
              offsetX: 0,
              offsetY: 2
            })
            .border({ 
              width: 2, 
              color: this.isPlaying ? '#27AE60' : '#E74C3C' 
            })
            .onPrepared((e?: PreparedInfo) => {
              console.info('Video onPrepared: ' + JSON.stringify(e));
              this.statusMsg = `✅ onPrepared事件触发!\\n时长: ${e?.duration}秒`;
              this.videoStatus = 'success';
              this.duration = e?.duration || 0;
              this.addEvent('onPrepared事件触发');
            })
            .onStart(() => {
              this.isPlaying = true;
              this.videoStatus = 'playing';
              this.addEvent('视频开始播放');
            })
            .onError(() => {
              this.statusMsg = '❌ 视频加载失败';
              this.videoStatus = 'error';
              this.addEvent('视频加载失败');
            })
        }
        .width('100%')
        .padding(16)
        .backgroundColor(Color.White)
        .borderRadius(16)
        .shadow({
          radius: 8,
          color: '#1A000000',
          offsetX: 0,
          offsetY: 4
        })
      }
      .width('100%')
      .margin({ bottom: 12 })

      // 进度显示区域
      Column() {
        Text('📊 进度信息')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 8 })

        Row() {
          Column() {
            Text('当前时间')
              .fontSize(12)
              .fontColor('#7F8C8D')
            Text(`${Math.floor(this.currentTime)}秒`)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#3498DB')
          }
          .layoutWeight(1)

          Column() {
            Text('视频时长')
              .fontSize(12)
              .fontColor('#7F8C8D')
            Text(`${Math.floor(this.duration)}秒`)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#9B59B6')
          }
          .layoutWeight(1)

          Column() {
            Text('播放状态')
              .fontSize(12)
              .fontColor('#7F8C8D')
            Text(this.isPlaying ? '播放中' : '已停止')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(this.isPlaying ? '#27AE60' : '#E74C3C')
          }
          .layoutWeight(1)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
      }
      .width('100%')
      .padding(12)
      .backgroundColor(Color.White)
      .borderRadius(8)
      .shadow({
        radius: 4,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })
      .margin({ bottom: 12 })

      // 控制面板
      Column() {
        Text('🎮 控制面板')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 16 })

        Row() {
          Button('⏭️ 跳转到第10s')
            .id('seekButton_26')
            .width('48%')
            .height(44)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .backgroundColor('#3498DB')
            .fontColor(Color.White)
            .borderRadius(8)
            .onClick(() => {
              this.controller.setCurrentTime(10, SeekMode.Accurate);
              this.operationCount++;
              this.currentTime = 10;
              this.statusMsg = '已跳转到第10s';
              this.addEvent('点击跳转到第10s按钮');
            })
          
          Button('▶️ 开始播放')
            .id('startButton_26')
            .width('48%')
            .height(44)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .backgroundColor('#27AE60')
            .fontColor(Color.White)
            .borderRadius(8)
            .onClick(() => {
              this.controller.start();
              this.operationCount++;
              this.statusMsg = '已开始播放';
              this.addEvent('点击开始播放按钮');
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .width('100%')
      .padding(12)
      .backgroundColor(Color.White)
      .borderRadius(8)
      .shadow({
        radius: 4,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })
      .margin({ bottom: 12 })

      // 事件历史记录
      Column() {
        Text('📝 事件历史')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 16 })

        Text(this.eventHistory.length > 0 ? this.eventHistory.join('\\n') : '暂无事件记录')
          .fontSize(14)
          .fontColor('#5D6D7E')
          .lineHeight(20)
          .textAlign(TextAlign.Start)
          .width('100%')
          .padding(16)
          .backgroundColor('#F8F9FA')
          .borderRadius(8)
          .border({ width: 1, color: '#E9ECEF' })
      }
      .width('100%')
      .padding(12)
      .backgroundColor(Color.White)
      .borderRadius(8)
      .shadow({
        radius: 4,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })
      .margin({ bottom: 12 })

      // 状态显示区域
      Column() {
        Text('📊 状态信息')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 16 })

        // 操作统计
        Row() {
          Column() {
            Text('操作次数')
              .fontSize(12)
              .fontColor('#7F8C8D')
            Text(`${this.operationCount}`)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor('#3498DB')
          }
          .layoutWeight(1)

          Column() {
            Text('事件数量')
              .fontSize(12)
              .fontColor('#7F8C8D')
            Text(`${this.eventHistory.length}`)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor('#9B59B6')
          }
          .layoutWeight(1)

          Column() {
            Text('播放状态')
              .fontSize(12)
              .fontColor('#7F8C8D')
            Text(this.isPlaying ? '播放中' : '已停止')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.isPlaying ? '#27AE60' : '#E74C3C')
          }
          .layoutWeight(1)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ bottom: 8 })

        // 事件日志
        Text(this.statusMsg)
          .fontSize(12)
          .fontColor('#2C3E50')
          .textAlign(TextAlign.Center)
          .width('100%')
          .padding(8)
          .backgroundColor('#F8F9FA')
          .borderRadius(6)
          .border({ width: 1, color: '#E9ECEF' })
      }
      .width('100%')
      .padding(12)
      .backgroundColor(Color.White)
      .borderRadius(8)
      .shadow({
        radius: 4,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })
      .margin({ bottom: 12 })

      // 测试说明
      Column() {
        Text('📋 测试说明')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 16 })

        Text('1. 查看三个视频的展示效果\\n2. 点击"跳转到第10s"按钮跳转进度\\n3. 点击"开始播放"按钮开始播放\\n4. 观察视频播放进度位置是否正确\\n5. 检查事件历史记录和状态更新')
          .fontSize(14)
          .fontColor('#5D6D7E')
          .lineHeight(20)
          .textAlign(TextAlign.Start)
          .width('100%')
      }
      .width('100%')
      .padding(20)
      .backgroundColor(Color.White)
      .borderRadius(16)
      .shadow({
        radius: 8,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 4
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
    .padding(12)
    .justifyContent(FlexAlign.Start)
  }
}
