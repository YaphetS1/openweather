//
//  ViewController.swift
//  weather
//
//  Created by Дмитрий Маринин on 16.11.2020.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var stubView: UIView! // Most likely it will be separate view
    @IBOutlet weak var contentView: UIView! // By def - hidden
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var containerImages: UIStackView!
    
    var interactor: OpenweatherInteractorProtocol
    let locationManager = CLLocationManager()
    
    // By default init with coorditane of Moscow
    var coordinate: Coordinate = Coordinate() {
        didSet {
            interactor = OpenweatherInteractor(coordinate: coordinate)
            setupView()
        }
    }
    
    // MARK: - Init
    
    init() {
        interactor = OpenweatherInteractor(coordinate: coordinate)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        interactor = OpenweatherInteractor(coordinate: coordinate)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocation()
        showOrHideStub()
        setupView()
    }
    
    func setupView() {
        interactor.refresh() { [weak self] (err, vm) in
            /// Show error stub, if it need
            guard let viewModel = vm else { return }

            self?.showOrHideStub()
            self?.configureView(viewModel)
        }
    }
    
    func showOrHideStub() {
        stubView.isHidden = !interactor.isUpdating
        contentView.isHidden = interactor.isUpdating
    }
    
    /// Attension use that when ViewModel are done
    func configureView(_ viewModel: OpenweatherViewModel) {
        containerImages.removeAllArrangedSubviews()
        
        tempLabel.text = viewModel.currentTemp
        humidityLabel.text = viewModel.humidity
        windSpeedLabel.text = viewModel.windSpeed
        
        viewModel.iconsUrls.forEach({ path in
            guard let path = path else { return }
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            containerImages.addArrangedSubview(imageView)
            imageView.downloadImage(from: path)
        })
    }

    func requestLocation() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
}

// That most likely use in separator CV, but I don't have enogh time for that :-)
// I think you will understand me

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        coordinate = Coordinate(lat: locValue.latitude, lon: locValue.longitude)
    }
}
