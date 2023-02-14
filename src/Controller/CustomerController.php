<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CustomerController extends AbstractController
{
    /**
<<<<<<< HEAD
     * @Route("/cus", "name=app_customer")
=======
     * @Route("/cus", name="app_customer")
>>>>>>> hien
     */
    public function FunctionName(): Response
    {
        return $this->render('customer/index.html.twig', [
            'controller_name' => 'CustomerController',
        ]);
    }

    
}
