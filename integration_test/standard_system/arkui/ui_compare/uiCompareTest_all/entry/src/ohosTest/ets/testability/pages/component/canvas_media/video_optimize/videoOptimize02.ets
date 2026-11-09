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
struct VideoOptimize02 {
  @State isAutoPlay: boolean = false;
  @State statusMsg: string = '等待操作...';
  @State operationCount: number = 0;
  @State videoStatus: 'idle' | 'loading' | 'success' | 'error' = 'idle';
  @State currentVideoIndex: number = 0;
  controller: VideoController = new VideoController();

  getStatusText(): string {
    switch (this.videoStatus) {
      case 'idle': return '空闲';
      case 'loading': return '加载中';
      case 'success': return '成功';
      case 'error': return '错误';
      default: return '未知';
    }
  }

  build() {
    Column() {
      // 页面标题
      Row() {
        Text('🎭')
          .fontSize(24)
          .margin({ right: 8 })
        
        Column() {
          Text('Video组件重置AVPlayer和自动播放测试(三Video)')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2C3E50')
          
          Text('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0020')
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
            .height(120)
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
                    this.videoStatus === 'loading' ? '#F39C12' : '#95A5A6')
              .margin({ left: 8 })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .margin({ bottom: 8 })

          Video({
            src: $rawfile('video3.mp4'),
            controller: this.controller
          })
            .id('video_02')
            .width('100%')
            .height(100)
            .autoPlay(this.isAutoPlay)
            .borderRadius(8)
            .shadow({
              radius: 4,
              color: '#1F000000',
              offsetX: 0,
              offsetY: 2
            })
            .border({ 
              width: 2, 
              color: this.isAutoPlay ? '#27AE60' : '#E74C3C' 
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

      // 控制面板
      Column() {
        Text('🎮 控制面板')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 8 })

        Row() {
          Button('🔄 重置AVPlayer')
            .id('resetButton_02')
            .width('48%')
            .height(32)
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .backgroundColor('#3498DB')
            .fontColor(Color.White)
            .borderRadius(6)
            .onClick(() => {
              this.controller.reset();
              this.operationCount++;
              this.statusMsg = `🔄 已重置AVPlayer (操作次数: ${this.operationCount})`;
              this.videoStatus = 'loading';
            })
          
          Button('🎯 打开自动播放')
            .id('autoPlayButton_02')
            .width('48%')
            .height(32)
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .backgroundColor('#27AE60')
            .fontColor(Color.White)
            .borderRadius(6)
            .onClick(() => {
              this.isAutoPlay = true;
              this.operationCount++;
              this.statusMsg = `🎯 已打开自动播放 (操作次数: ${this.operationCount})`;
              this.videoStatus = 'success';
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

      // 状态显示区域
      Column() {
        Text('📊 状态信息')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 8 })

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
            Text('自动播放')
              .fontSize(12)
              .fontColor('#7F8C8D')
            Text(this.isAutoPlay ? '已启用' : '已禁用')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.isAutoPlay ? '#27AE60' : '#E74C3C')
          }
          .layoutWeight(1)

          Column() {
            Text('视频状态')
              .fontSize(12)
              .fontColor('#7F8C8D')
            Text(this.getStatusText())
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#34495E')
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
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 8 })

        Text('1. 查看三个视频的展示效果\\n2. 点击"重置AVPlayer"按钮重置播放器\\n3. 点击"打开自动播放"按钮启用自动播放\\n4. 观察第三个视频是否自动开始播放\\n5. 检查视频状态指示器的变化')
          .fontSize(12)
          .fontColor('#5D6D7E')
          .lineHeight(16)
          .textAlign(TextAlign.Start)
          .width('100%')
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
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
    .padding(12)
    .justifyContent(FlexAlign.Start)
  }
}
