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
struct VideoOptimize01 {
  @State isAutoPlay: boolean = false;
  @State statusMsg: string = '等待onPrepared事件触发...';
  @State operationCount: number = 0;
  @State videoStatus: 'idle' | 'loading' | 'success' | 'error' = 'idle';
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
        Text('🎬')
          .fontSize(24)
          .margin({ right: 8 })
        
        Column() {
          Text('Video组件重置AVPlayer和自动播放测试')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2C3E50')
          
          Text('SUB_ACE_UI_COMPONENT_MEDIA_VIDEO_OPTIMIZE_0010')
            .fontSize(12)
            .fontColor('#7F8C8D')
            .margin({ top: 2 })
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ bottom: 16 })

      // 视频播放区域
      Column() {
        Video({
          src: $rawfile('video1.mp4'),
          controller: this.controller
        })
          .id('video_01')
          .width('100%')
          .height(180)
          .autoPlay(this.isAutoPlay)
          .borderRadius(8)
          .shadow({
            radius: 6,
            color: '#1F000000',
            offsetX: 0,
            offsetY: 3
          })
          .onPrepared((e?: PreparedInfo) => {
            console.info('Video onPrepared: ' + JSON.stringify(e));
            this.statusMsg = `✅ onPrepared事件触发!\\n时长: ${e?.duration}秒`;
            this.videoStatus = 'success';
          })
          .onError(() => {
            this.statusMsg = '❌ 视频加载失败';
            this.videoStatus = 'error';
          })

        // 视频状态指示器
        Row() {
          Circle({ width: 8, height: 8 })
            .fill(this.videoStatus === 'success' ? '#27AE60' : 
                  this.videoStatus === 'error' ? '#E74C3C' : 
                  this.videoStatus === 'loading' ? '#F39C12' : '#95A5A6')
            .margin({ right: 6 })
          
          Text(`视频状态: ${this.getStatusText()}`)
            .fontSize(12)
            .fontColor('#34495E')
        }
        .margin({ top: 8 })
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .padding(12)
      .backgroundColor(Color.White)
      .borderRadius(12)
      .shadow({
        radius: 8,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 4
      })
      .margin({ bottom: 16 })

      // 控制面板
      Column() {
        Text('🎮 控制面板')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 12 })

        Row() {
          Button('🔄 重置AVPlayer')
            .id('resetButton_01')
            .width('48%')
            .height(36)
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
            .id('autoPlayButton_01')
            .width('48%')
            .height(36)
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
      .padding(16)
      .backgroundColor(Color.White)
      .borderRadius(12)
      .shadow({
        radius: 6,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 3
      })
      .margin({ bottom: 16 })

      // 状态显示区域
      Column() {
        Text('📊 状态信息')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 12 })

        // 操作统计
        Row() {
          Column() {
            Text('操作次数')
              .fontSize(10)
              .fontColor('#7F8C8D')
            Text(`${this.operationCount}`)
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#3498DB')
          }
          .layoutWeight(1)

          Column() {
            Text('自动播放')
              .fontSize(10)
              .fontColor('#7F8C8D')
            Text(this.isAutoPlay ? '已启用' : '已禁用')
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor(this.isAutoPlay ? '#27AE60' : '#E74C3C')
          }
          .layoutWeight(1)

          Column() {
            Text('视频状态')
              .fontSize(10)
              .fontColor('#7F8C8D')
            Text(this.getStatusText())
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor('#34495E')
          }
          .layoutWeight(1)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ bottom: 12 })

        // 事件日志
        Text(this.statusMsg)
          .fontSize(12)
          .fontColor('#2C3E50')
          .textAlign(TextAlign.Center)
          .width('100%')
          .padding(12)
          .backgroundColor('#F8F9FA')
          .borderRadius(6)
          .border({ width: 1, color: '#E9ECEF' })
      }
      .width('100%')
      .padding(16)
      .backgroundColor(Color.White)
      .borderRadius(12)
      .shadow({
        radius: 6,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 3
      })
      .margin({ bottom: 16 })

      // 测试说明
      Column() {
        Text('📋 测试说明')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2C3E50')
          .margin({ bottom: 12 })

        Text('1. 点击"重置AVPlayer"按钮重置视频播放器\\n2. 点击"打开自动播放"按钮启用自动播放\\n3. 观察视频是否自动开始播放\\n4. 检查onPrepared事件是否正确触发')
          .fontSize(12)
          .fontColor('#5D6D7E')
          .lineHeight(16)
          .textAlign(TextAlign.Start)
          .width('100%')
      }
      .width('100%')
      .padding(16)
      .backgroundColor(Color.White)
      .borderRadius(12)
      .shadow({
        radius: 6,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 3
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
    .padding(16)
    .justifyContent(FlexAlign.Start)
  }
}
