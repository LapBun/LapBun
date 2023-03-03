<?php

namespace App\Controller;

use App\Entity\Orders;
use App\Repository\CartRepository;
use App\Repository\OrdersRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrdersController extends AbstractController
{
    /**
     * @Route("/add/orders", name="add_order")
     */
    public function orderAction(CartRepository $repo,OrdersRepository $Orepo,Request $req, ManagerRegistry $red): Response
    {
        
        $user = $this->getUser();

        $get = $repo->getCart($user);

        foreach ($get as $i) {
            // $order->setCreatedate(DateTime().current());
            $order = new Orders();
            $email = $get[0]['email'];
            $product = $get[0]['name'];
            $quantity = $get[0]['qty'];
            $date = new \DateTime();
            $date->format('H:i:s \O\n d-m-Y');

            $order->setOuser($email);
            $order->setOproduct($product);
            $order->setQuantity($quantity);
            $order->setCreatedate($date);

            $entity = $red->getManager();
            
            $entity->persist($order);
            $entity->flush();
        }


        return $this->render('cart/index.html.twig', [
            'cart'=> $product,
            ]);
    }
    /**
     * @Route("/orders", name="order_show")
     */
    public function orderShow(OrdersRepository $repo): Response
    {
        $order = $repo->findAll();
        return $this->render('orders/index.html.twig', [
            'orders'=>$order
        ]);
    }
}
