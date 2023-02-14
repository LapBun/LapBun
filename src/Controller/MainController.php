<?php

namespace App\Controller;

<<<<<<< HEAD
use App\Repository\ProductRepository;
=======
>>>>>>> hien
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MainController extends AbstractController
{
<<<<<<< HEAD
    private ProductRepository $repo;
    public function __construct(ProductRepository $repo)
   {
      $this->repo = $repo;
   }
    /**
     * @Route("/", name="homepage")
     */
    public function indexPageAction(): Response
    {
        $products = $this->repo->findAll();
        return $this->render('home.html.twig', [
            'products'=>$products
        ]);
    }
     /**
     * @Route("/admin", name="adminPage")
     */
    public function adminPageAction(): Response{
        return $this->render('admin.html.twig', [
            
=======
    #[Route('/main', name: 'app_main')]
    public function index(): Response
    {
        return $this->render('main/index.html.twig', [
            'controller_name' => 'MainController',
        ]);
    }
    /**
     * @Route("/main", name="app_main")
     */
    public function FunctionName(): Response
    {
        return $this->render('main/index.html.twig', [
            'controller_name' => 'MainController',
>>>>>>> hien
        ]);
    }
}
