//
//  PageController.swift
//  PronacaShareholders
//
//  Created by CarlosDz on 12/09/21.
//

import UIKit

class PageController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var sliderScrollView: UIScrollView!
    @IBOutlet weak var nextButton: UIButton!
    
    var slides: [Slide] = []
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderScrollView.delegate = self
        sliderScrollView.isDirectionalLockEnabled = true
        
        let testImages: [UIImage] = [UIImage(named: "comida1")!, UIImage(named: "comida2")!, UIImage(named: "comida3")!, UIImage(named: "comida4")!]
        slides = createSlides(images: testImages)
        setUpSlideControllerView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        nextButton.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func createSlides(images: [UIImage]) -> [Slide] {
        var slides: [Slide] = []
        for image in images {
            slides.append(Slide(image: image))
        }
        return slides
    }
    
    private func setUpSlideControllerView(slides: [Slide]) {
        sliderScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        sliderScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        sliderScrollView.isPagingEnabled = true
        sliderScrollView.clipsToBounds = false
        for i in 0..<slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            sliderScrollView.addSubview(slides[i])
        }
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        guard let navigation = self.navigationController else {
            dismiss(animated: true, completion: nil)
            return
        }
        navigation.popViewController(animated: true)
    }
}

// MARK: - UIScrollViewDelegate -
extension PageController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        nextButton.isHidden = Int(pageIndex) != slides.count - 1
        print("PageIndex: \(pageIndex))")
        print("Page: \(Int(pageIndex)) Slide: \(slides.count)")
    }
}

class Slide: UIImageView { }
