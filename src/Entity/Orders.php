<?php

namespace App\Entity;

use App\Repository\OrdersRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: OrdersRepository::class)]
class Orders
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $createdate = null;

    #[ORM\Column]
    private ?int $quantity = null;

    #[ORM\Column(length: 255)]
    private ?string $Ouser = null;

    #[ORM\Column(length: 255)]
    private ?string $Oproduct = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCreatedate(): ?\DateTimeInterface
    {
        return $this->createdate;
    }

    public function setCreatedate(\DateTimeInterface $createdate): self
    {
        $this->createdate = $createdate;

        return $this;
    }

    public function getQuantity(): ?int
    {
        return $this->quantity;
    }

    public function setQuantity(int $quantity): self
    {
        $this->quantity = $quantity;

        return $this;
    }

    public function getOuser(): ?string
    {
        return $this->Ouser;
    }

    public function setOuser(string $Ouser): self
    {
        $this->Ouser = $Ouser;

        return $this;
    }

    public function getOproduct(): ?string
    {
        return $this->Oproduct;
    }

    public function setOproduct(string $Oproduct): self
    {
        $this->Oproduct = $Oproduct;

        return $this;
    }
}
